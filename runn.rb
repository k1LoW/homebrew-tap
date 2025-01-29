class Runn < Formula
  desc 'runn is a tool for running operations following a scenario.'
  homepage 'https://github.com/k1LoW/runn'
  version '0.127.4'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/runn/releases/download/v0.127.4/runn_v0.127.4_darwin_arm64.zip'
      sha256 '5a6ceecdda0e2603f59173d78df9c5661ee2effad1d1ae96456d7fd1b7e2ed42'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.127.4/runn_v0.127.4_darwin_amd64.zip'
      sha256 '5cab9020b6c6932fc1180f967268e62edc94ae4f92da9fdb004765702e81216c'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.127.4/runn_v0.127.4_linux_amd64.tar.gz'
      sha256 '4b7644529d64711510a25455eef0590cbe7517e24cee3c9b5f4587b72b5b67a6'
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
