class Deck < Formula
  desc 'deck is a tool for creating deck using Google Slides.'
  version '0.4.0'
  homepage 'https://github.com/k1LoW/deck'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/deck/releases/download/v0.4.0/deck_v0.4.0_darwin_arm64.zip'
      sha256 '0e589fb003c05c573cee8f74f5fa27780f9cb08e2d8f44a59b2e1b9cf6718651'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/deck/releases/download/v0.4.0/deck_v0.4.0_darwin_amd64.zip'
      sha256 'b23ffc107fc175a773b63457c334496a9570b5f683e3efb32ae2622dee125248'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/deck/releases/download/v0.4.0/deck_v0.4.0_linux_arm64.tar.gz'
      sha256 'aec2279b3ad59d579d7201d81e1fbb3636e6032210520f99996424d9ec8032cf'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/deck/releases/download/v0.4.0/deck_v0.4.0_linux_amd64.tar.gz'
      sha256 'ecc3155be586c74229e3bcea7728c80ab85180514422ac57f8d0ca8c2c97cb26'
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
