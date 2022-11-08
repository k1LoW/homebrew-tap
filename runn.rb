class Runn < Formula
  desc 'runn is a tool for running operations following a scenario.'
  homepage 'https://github.com/k1LoW/runn'
  version '0.47.0'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/runn/releases/download/v0.47.0/runn_v0.47.0_darwin_arm64.zip'
      sha256 '285d1f1db0d46ae0e4e3719a0de1ad2b014318e0898ee8f99bcb5eff30d01753'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.47.0/runn_v0.47.0_darwin_amd64.zip'
      sha256 'eecf233f7c725589c63b9a567163a212ec35123c09694d36755a63eae7b804a7'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.47.0/runn_v0.47.0_linux_amd64.tar.gz'
      sha256 '735abc22ab5ee5495cd43fe02057c78f4031cae58d34031e51270939c9176934'
    end
  end

  head do
    url 'https://github.com/k1LoW/runn.git'
    depends_on 'go' => :build
  end

  def install
    system 'make', 'build' if build.head?
    bin.install 'runn'
    output = Utils.safe_popen_read("#{bin}/runn", 'completion', 'bash')
    (bash_completion/'runn').write output
    output = Utils.safe_popen_read("#{bin}/runn", 'completion', 'zsh')
    (zsh_completion/'_runn').write output
  end
end
