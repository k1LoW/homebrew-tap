class Deck < Formula
  desc 'deck is a tool for creating deck using Google Slides.'
  version '0.18.0'
  homepage 'https://github.com/k1LoW/deck'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/deck/releases/download/v0.18.0/deck_v0.18.0_darwin_arm64.zip'
      sha256 '9c9b58f3022b806c01c0879b77afd7163b900ad30243a6eadcd2aa9e9da34e49'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/deck/releases/download/v0.18.0/deck_v0.18.0_darwin_amd64.zip'
      sha256 '2b86e6a77ec0c0b03303c4e894b396b840ac79f71b72e2340a2cbb82e8d2d8ca'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/deck/releases/download/v0.18.0/deck_v0.18.0_linux_arm64.tar.gz'
      sha256 '4b6e472aca6e7d7596e7a66ca1f524b5b192c8191c7efbc5397f4a4bc1a9d936'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/deck/releases/download/v0.18.0/deck_v0.18.0_linux_amd64.tar.gz'
      sha256 '51657a16704ec2f20132dc8911b6f13e811e06440390c516a667b7d0b682c900'
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
