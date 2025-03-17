class Deck < Formula
  desc 'deck is a tool for creating deck using Google Slides.'
  version '0.9.0'
  homepage 'https://github.com/k1LoW/deck'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/deck/releases/download/v0.9.0/deck_v0.9.0_darwin_arm64.zip'
      sha256 '3a5bc4a75ffa0b7a5b5aab0b43c39e074c562275865d3bd50520669d1281b0e7'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/deck/releases/download/v0.9.0/deck_v0.9.0_darwin_amd64.zip'
      sha256 '30ff8807854d92f1f87edd6144ab7cb2a86367d6cacd371791aac3c3c1a90fad'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/deck/releases/download/v0.9.0/deck_v0.9.0_linux_arm64.tar.gz'
      sha256 '0fc6988533694a3536b94de36fd831926449d8e4b744e08d98d50bd6022faaef'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/deck/releases/download/v0.9.0/deck_v0.9.0_linux_amd64.tar.gz'
      sha256 'c4967c68078bc5b1393810b52574fac436dcd28e9c8038fcdb512d048a77933f'
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
