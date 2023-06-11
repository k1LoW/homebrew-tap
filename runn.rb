class Runn < Formula
  desc 'runn is a tool for running operations following a scenario.'
  homepage 'https://github.com/k1LoW/runn'
  version '0.75.2'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/runn/releases/download/v0.75.2/runn_v0.75.2_darwin_arm64.zip'
      sha256 '02bce78f546670a75b2cc8e0c62ef4917c2a6faf25a32c7c5ce5ff654874c097'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.75.2/runn_v0.75.2_darwin_amd64.zip'
      sha256 '7efc07c8506d0cdae10c329b5e762bc43834d1685d58a0924314d67040b573b9'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.75.2/runn_v0.75.2_linux_amd64.tar.gz'
      sha256 '0ac3acc7459e30e76685eab20ff4d522216c6c329c76b7f98e5f9e0582a76f54'
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
