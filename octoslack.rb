class Octoslack < Formula
  desc 'octoslack is a tool for transforming HTTP requests from any webhook into Slack messages.'
  version '0.13.7'
  homepage 'https://github.com/k1LoW/octoslack'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/octoslack/releases/download/v0.13.7/octoslack_v0.13.7_darwin_arm64.zip'
      sha256 'af7308c6823e7f8374b72f1f9fb02582e4e1b0eb603a7d4c7e777e5c7cf2515a'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octoslack/releases/download/v0.13.7/octoslack_v0.13.7_darwin_amd64.zip'
      sha256 'bdc4a708931ea6f439e4303a4da6b3dbf12daf5a0b4a3a39968e7bebb6071bc1'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octoslack/releases/download/v0.13.7/octoslack_v0.13.7_linux_amd64.tar.gz'
      sha256 '7877ab9826f83ede0449a5bacfd8fcdade9742a553e6fa058f0e81a01fd95849'
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
