class Runn < Formula
  desc 'runn is a tool for running operations following a scenario.'
  homepage 'https://github.com/k1LoW/runn'
  version '0.117.2'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/runn/releases/download/v0.117.2/runn_v0.117.2_darwin_arm64.zip'
      sha256 '5fa6735b98d67a8be41db962c53b29b2d50c0800123cf833ccf3423e577d61a6'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.117.2/runn_v0.117.2_darwin_amd64.zip'
      sha256 '721e0f5e01c6a136f2d0aea58b86c3c173186facc50e6a8f70ffcb977dd4c61a'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.117.2/runn_v0.117.2_linux_amd64.tar.gz'
      sha256 '823e53a2f74f38f39e13c5cc3dc218b5dc15b7d1a302de92e4506b66620b8362'
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
