class Deck < Formula
  desc 'deck is a tool for creating deck using Google Slides.'
  version '1.23.0'
  homepage 'https://github.com/k1LoW/deck'

  deprecate! date: "2025-08-02", because: "please use the official Homebrew formula instead"

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/deck/releases/download/v1.23.0/deck_v1.23.0_darwin_arm64.zip'
      sha256 '51c289e25c1dc8d8be87a6cc6f210986c762cc8ff1d5c414ea61356d3ade17a2'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/deck/releases/download/v1.23.0/deck_v1.23.0_darwin_amd64.zip'
      sha256 '29c714cfdaeb3345f4cb20831cd35f3ffec86c646ef894799c2ee7d693682791'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/deck/releases/download/v1.23.0/deck_v1.23.0_linux_arm64.tar.gz'
      sha256 '7414531b11a09044ad1bd9f2a4c9bf5d2641f908ae92dcfbbfcee4259c6f487c'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/deck/releases/download/v1.23.0/deck_v1.23.0_linux_amd64.tar.gz'
      sha256 '35f6099f496aef3070d8aafa72639461d186a099707c2ce00171414aba7fdb1f'
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
