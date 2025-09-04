class Deck < Formula
  desc 'deck is a tool for creating deck using Google Slides.'
  version '1.21.1'
  homepage 'https://github.com/k1LoW/deck'

  deprecate! date: "2025-08-02", because: "please use the official Homebrew formula instead"

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/deck/releases/download/v1.21.1/deck_v1.21.1_darwin_arm64.zip'
      sha256 '1482a69d9d8ad0ed3e0222899cbf6edfaa94db65bf973a0c27d7bc6d9e2d9f53'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/deck/releases/download/v1.21.1/deck_v1.21.1_darwin_amd64.zip'
      sha256 'c7cf8cc4e34402d231a87612be08b8e4cc6b12bf1efeccd0399451f92d22f70f'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/deck/releases/download/v1.21.1/deck_v1.21.1_linux_arm64.tar.gz'
      sha256 'a02be34e9437d379f4631554df98d3152682bb476b91e3abcfd4228e3cef0fde'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/deck/releases/download/v1.21.1/deck_v1.21.1_linux_amd64.tar.gz'
      sha256 'ca5ee10941841143ee1e085e140fdbad055f3bb07c3399c0452688e46c73fe33'
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
