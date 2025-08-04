class Deck < Formula
  desc 'deck is a tool for creating deck using Google Slides.'
  version '1.9.0'
  homepage 'https://github.com/k1LoW/deck'

  deprecate! date: "2025-08-02", because: "please use the official Homebrew formula instead"

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/deck/releases/download/v1.9.0/deck_v1.9.0_darwin_arm64.zip'
      sha256 'c499f1fa77f7a0f760ef6b56fe20a7fcb37f5a0e09684e455c2bf273dfb42de8'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/deck/releases/download/v1.9.0/deck_v1.9.0_darwin_amd64.zip'
      sha256 '2e747805478bf66b7fd7885ec1769a6a9a27dbe9d082ba7909e2676a54142b20'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/deck/releases/download/v1.9.0/deck_v1.9.0_linux_arm64.tar.gz'
      sha256 '9378aff2e51f11c3a37365bec5daadf74cde97b1c4d837c2203a97d4cee79ec1'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/deck/releases/download/v1.9.0/deck_v1.9.0_linux_amd64.tar.gz'
      sha256 '68d9cfd2be1e2e2d75a0463cec550ea942479499cac2324703c253a3c75490d7'
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
