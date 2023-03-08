class Octoslack < Formula
  desc 'octoslack is a tool for transforming HTTP requests from any webhook into Slack messages.'
  version '0.7.0'
  homepage 'https://github.com/k1LoW/octoslack'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/octoslack/releases/download/v0.7.0/octoslack_v0.7.0_darwin_arm64.zip'
      sha256 '680e14ef317356f8d3f7c6f01b7e9a83b1a4aa42418b2b654c88e89e97ddbca0'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octoslack/releases/download/v0.7.0/octoslack_v0.7.0_darwin_amd64.zip'
      sha256 'dcac8302ab9050b67fec75c89799ad95ebc519c6bb70a8595a7c17a865af068f'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octoslack/releases/download/v0.7.0/octoslack_v0.7.0_linux_amd64.tar.gz'
      sha256 '1595b0f3be6532cae16f9ecf7bb882f7fe794fe6800b8be63dcc9fea44f1ed0a'
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
