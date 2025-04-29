class Deck < Formula
  desc 'deck is a tool for creating deck using Google Slides.'
  version '0.16.0'
  homepage 'https://github.com/k1LoW/deck'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/deck/releases/download/v0.16.0/deck_v0.16.0_darwin_arm64.zip'
      sha256 'c4e4ada718b3952df654d191b56de9e912bf590e6331f64c27903ef124bb5339'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/deck/releases/download/v0.16.0/deck_v0.16.0_darwin_amd64.zip'
      sha256 '3a8c8c924e01a7963ec1ac898be86958758ddacc4612a6b4cee1c8fea2dc1e9b'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/deck/releases/download/v0.16.0/deck_v0.16.0_linux_arm64.tar.gz'
      sha256 'ded4aabc8b7ed38f8ab893d88be3a91fbbc85d3634275df3f5f26e209df0c3cd'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/deck/releases/download/v0.16.0/deck_v0.16.0_linux_amd64.tar.gz'
      sha256 '63798a4b08cdc8830fbdb1f2ef8137a63ef750247ceae89c98bdfd4bbd957933'
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
