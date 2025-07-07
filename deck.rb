class Deck < Formula
  desc 'deck is a tool for creating deck using Google Slides.'
  version '0.37.0'
  homepage 'https://github.com/k1LoW/deck'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/deck/releases/download/v0.37.0/deck_v0.37.0_darwin_arm64.zip'
      sha256 '8441551181a5ca4bd45f6e4727dcfe14bf8f3d461ceb25d72724c451651a83af'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/deck/releases/download/v0.37.0/deck_v0.37.0_darwin_amd64.zip'
      sha256 '24734c22945cfc21ff02512de1ebb080bf89dbdb852529d13cb09598839ff773'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/deck/releases/download/v0.37.0/deck_v0.37.0_linux_arm64.tar.gz'
      sha256 '7028ac60af1ff88342bf7e0f3c27cf13ddbb8bac546b5d22007b3fd5e154c2af'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/deck/releases/download/v0.37.0/deck_v0.37.0_linux_amd64.tar.gz'
      sha256 'f727287f956a3e8df86ec3c90fc5759adf7e4600ef8a418a0c915ff89171328d'
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
