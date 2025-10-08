class Runn < Formula
  desc 'runn is a tool for running operations following a scenario.'
  homepage 'https://github.com/k1LoW/runn'
  version '0.139.0'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/runn/releases/download/v0.139.0/runn_v0.139.0_darwin_arm64.zip'
      sha256 '2b06c8bd89069b4a77b9f69b072bf4f0183d5826a2a9c20094dde1dbf146a293'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.139.0/runn_v0.139.0_darwin_amd64.zip'
      sha256 '5f702f27c327937360f419dfe182d97267600bf33402385a3b28872ac5f310b5'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.139.0/runn_v0.139.0_linux_amd64.tar.gz'
      sha256 '0f2e2e56d84d8d10509b015f20e0dc4d0c06c24aed58438b48cd034f6a5b1aee'
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
