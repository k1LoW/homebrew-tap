class Deck < Formula
  desc 'deck is a tool for creating deck using Google Slides.'
  version '1.21.6'
  homepage 'https://github.com/k1LoW/deck'

  deprecate! date: "2025-08-02", because: "please use the official Homebrew formula instead"

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/deck/releases/download/v1.21.6/deck_v1.21.6_darwin_arm64.zip'
      sha256 '485aa1bce8e9d5f60f30527fce3aad58d250aae6e133b6fe436f18292f0b00e8'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/deck/releases/download/v1.21.6/deck_v1.21.6_darwin_amd64.zip'
      sha256 '19c00e2b6a549371d5504adb71729fdff0a5cc22d390ba68a58a2a0a04238a6f'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/deck/releases/download/v1.21.6/deck_v1.21.6_linux_arm64.tar.gz'
      sha256 '83e9c41f7d46cd7e27cb8f8ccf7dd3d903eaf46ca04031cca6f0aea6b7191a71'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/deck/releases/download/v1.21.6/deck_v1.21.6_linux_amd64.tar.gz'
      sha256 'ed74f794717e19746c73256f6266fa11f599f7bb7087d2ecd0145709dfb39302'
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
