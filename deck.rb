class Deck < Formula
  desc 'deck is a tool for creating deck using Google Slides.'
  version '1.16.1'
  homepage 'https://github.com/k1LoW/deck'

  deprecate! date: "2025-08-02", because: "please use the official Homebrew formula instead"

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/deck/releases/download/v1.16.1/deck_v1.16.1_darwin_arm64.zip'
      sha256 'dfa959d05a4c339be55b73e9f94502023bcf12574676b868833adc7a1a2d4e47'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/deck/releases/download/v1.16.1/deck_v1.16.1_darwin_amd64.zip'
      sha256 '4a8346186bcae05e0163501b7f8df5843180d0105ddc259f69d695a052cf9bc2'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/deck/releases/download/v1.16.1/deck_v1.16.1_linux_arm64.tar.gz'
      sha256 '775f4ad923ae0e6d381440fb4b569fcc58d76bd28db2a7a2e7e9c7bf196624c8'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/deck/releases/download/v1.16.1/deck_v1.16.1_linux_amd64.tar.gz'
      sha256 'a7129d291f32b4dbd96f2f3c3a8172489853cdcb58f0bfe10d161b52e57a9f7d'
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
