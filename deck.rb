class Deck < Formula
  desc 'deck is a tool for creating deck using Google Slides.'
  version '1.22.1'
  homepage 'https://github.com/k1LoW/deck'

  deprecate! date: "2025-08-02", because: "please use the official Homebrew formula instead"

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/deck/releases/download/v1.22.1/deck_v1.22.1_darwin_arm64.zip'
      sha256 'f89ff2522a7a2fc2fa2de40f04a4ffaf5e2b76464be741d03e892bc8cc74b106'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/deck/releases/download/v1.22.1/deck_v1.22.1_darwin_amd64.zip'
      sha256 '611f08e22a01a96f1c53e1f8cab44e8ffa751a054155cb93aa992b1a50c7ce54'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/deck/releases/download/v1.22.1/deck_v1.22.1_linux_arm64.tar.gz'
      sha256 'aede00897cabc4665afed18fb185babd2927be3698a4ed7cdeba81b2e4f352ef'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/deck/releases/download/v1.22.1/deck_v1.22.1_linux_amd64.tar.gz'
      sha256 'd3c314ba7d77b76ba6c33ac8c3468204c0a265cf87a1d7962bf44c1d4880374c'
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
