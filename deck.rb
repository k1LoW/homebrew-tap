class Deck < Formula
  desc 'deck is a tool for creating deck using Google Slides.'
  version '0.42.0'
  homepage 'https://github.com/k1LoW/deck'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/deck/releases/download/v0.42.0/deck_v0.42.0_darwin_arm64.zip'
      sha256 '2915b0624c9cc044aa156c27e58c1b284c803d3aa65fefb34eb1e73bd749e101'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/deck/releases/download/v0.42.0/deck_v0.42.0_darwin_amd64.zip'
      sha256 '413ffbe90ee69880d1beae531725c3ceaaa3afd81435d842c8859a0e37ee5baa'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/deck/releases/download/v0.42.0/deck_v0.42.0_linux_arm64.tar.gz'
      sha256 '454ba3c4411353f6859a617c93bed738d7958020228b2254c70653bb977ba8bf'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/deck/releases/download/v0.42.0/deck_v0.42.0_linux_amd64.tar.gz'
      sha256 'f5034bd9d8fc418f69c136105751ee51522898e92a81baac41bdcb47ce6a6a08'
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
