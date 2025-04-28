class Deck < Formula
  desc 'deck is a tool for creating deck using Google Slides.'
  version '0.15.0'
  homepage 'https://github.com/k1LoW/deck'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/deck/releases/download/v0.15.0/deck_v0.15.0_darwin_arm64.zip'
      sha256 '34ea74446fe01079aaf303a897f0bbe39be2c9b94e69bf1ea0e24f461ffbe85f'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/deck/releases/download/v0.15.0/deck_v0.15.0_darwin_amd64.zip'
      sha256 '7bff065b2428303e3bdbdfa6f92f643ed0e00f87ac4be11b5501998d4cf79835'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/deck/releases/download/v0.15.0/deck_v0.15.0_linux_arm64.tar.gz'
      sha256 'c6483a621594a2c0495523fb8f7cf4926cfb2bc20f8c8d3c4d359a0d647fc0e4'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/deck/releases/download/v0.15.0/deck_v0.15.0_linux_amd64.tar.gz'
      sha256 'a6b00f6bf6fb43c2520f4a02e64465c69818d9b59600157ceea8ae5b53291c64'
    end
  end

  head do
    url 'https://github.com/k1LoW/deck.git'
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    bin.install 'deck'
  end
end
