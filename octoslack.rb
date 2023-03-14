class Octoslack < Formula
  desc 'octoslack is a tool for transforming HTTP requests from any webhook into Slack messages.'
  version '0.8.1'
  homepage 'https://github.com/k1LoW/octoslack'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/octoslack/releases/download/v0.8.1/octoslack_v0.8.1_darwin_arm64.zip'
      sha256 '35f2daea9ac3d7321166ed74b29fc8540816f5fad95ddf47e5f1feeb6f72841a'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octoslack/releases/download/v0.8.1/octoslack_v0.8.1_darwin_amd64.zip'
      sha256 'be4d65ede7ed8f0a68d3f0c9e7175c5f7825390178ad39402ca93201c69315c9'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octoslack/releases/download/v0.8.1/octoslack_v0.8.1_linux_amd64.tar.gz'
      sha256 'bfdb979e9e6519ebbcef280e2252c91d3dd29e0d206273ee6f5caef31e4fccf4'
    end
  end

  head do
    url 'https://github.com/k1LoW/octoslack.git'
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    bin.install 'octoslack'
  end
end
