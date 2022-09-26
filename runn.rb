class Runn < Formula
  desc 'runn is a tool for running operations following a scenario.'
  homepage 'https://github.com/k1LoW/runn'
  version '0.35.2'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/runn/releases/download/v0.35.2/runn_v0.35.2_darwin_arm64.zip'
      sha256 'e1c78cc1f35b115e920804940b101d3b70ebc06e3234228c01971b5d39839d12'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.35.2/runn_v0.35.2_darwin_amd64.zip'
      sha256 '489b2f04315393b4214a3ad73bd5ebcce9ad3a4039f1976775ecec90989c8d49'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.35.2/runn_v0.35.2_linux_amd64.tar.gz'
      sha256 'fed963a61ab379e15b2f723c84c61c89060044ddb19aaa69c51ac85e5e849b11'
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
