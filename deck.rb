class Deck < Formula
  desc 'deck is a tool for creating deck using Google Slides.'
  version '1.21.4'
  homepage 'https://github.com/k1LoW/deck'

  deprecate! date: "2025-08-02", because: "please use the official Homebrew formula instead"

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/deck/releases/download/v1.21.4/deck_v1.21.4_darwin_arm64.zip'
      sha256 'af090faf265d158e13164162d24cd6fce7223e5c86bf040c66c2d7f4d6389ed1'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/deck/releases/download/v1.21.4/deck_v1.21.4_darwin_amd64.zip'
      sha256 '4f89c2af9aa83a4c43d5bb4838bfae15ab3d3b6f53d9dc2c0caa9f3812c136af'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/deck/releases/download/v1.21.4/deck_v1.21.4_linux_arm64.tar.gz'
      sha256 'cf3ed619cc7ea90543bb71e8610a986955b0ee96ee637d2b90b864554c0d9f82'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/deck/releases/download/v1.21.4/deck_v1.21.4_linux_amd64.tar.gz'
      sha256 'b151463b45cfc4a9ca16cfcb2af6a1bb7e336b778b2f6d735f2c6854db90490d'
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
