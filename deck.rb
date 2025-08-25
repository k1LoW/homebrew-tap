class Deck < Formula
  desc 'deck is a tool for creating deck using Google Slides.'
  version '1.17.2'
  homepage 'https://github.com/k1LoW/deck'

  deprecate! date: "2025-08-02", because: "please use the official Homebrew formula instead"

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/deck/releases/download/v1.17.2/deck_v1.17.2_darwin_arm64.zip'
      sha256 '3178c1b8da8f91cfe49257469fc1b3c658299a1238fd38e619123062b9da39d7'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/deck/releases/download/v1.17.2/deck_v1.17.2_darwin_amd64.zip'
      sha256 '035999fe2edfec9f68a5e567748821450108d14b507e7a4752d2c5a493f342c4'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/deck/releases/download/v1.17.2/deck_v1.17.2_linux_arm64.tar.gz'
      sha256 'ce1131ae335778e18364276bc0c9396839dcd70920938370d53311d4a77a0e1d'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/deck/releases/download/v1.17.2/deck_v1.17.2_linux_amd64.tar.gz'
      sha256 '012686252dfbb56bfd00de8941bf7805b176e5e96211fe88bacefbba67a72533'
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
