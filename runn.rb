class Runn < Formula
  desc 'runn is a tool for running operations following a scenario.'
  homepage 'https://github.com/k1LoW/runn'
  version '0.41.0'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/runn/releases/download/v0.41.0/runn_v0.41.0_darwin_arm64.zip'
      sha256 'dc8e7330600df1af881e435965326c91499c9a2f2564bbd39c31fbf49e0422f3'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.41.0/runn_v0.41.0_darwin_amd64.zip'
      sha256 'a74559f04df21ea97db7f607ca212df902554bb0b1df607e90f20073a81e67ef'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.41.0/runn_v0.41.0_linux_amd64.tar.gz'
      sha256 '8e0e97a2d121a814e2e4d5ffb2bdc7d82076297e55ea60157c305389201018ab'
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
