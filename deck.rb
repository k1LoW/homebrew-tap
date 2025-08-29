class Deck < Formula
  desc 'deck is a tool for creating deck using Google Slides.'
  version '1.17.3'
  homepage 'https://github.com/k1LoW/deck'

  deprecate! date: "2025-08-02", because: "please use the official Homebrew formula instead"

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/deck/releases/download/v1.17.3/deck_v1.17.3_darwin_arm64.zip'
      sha256 'f52c484b21fc99427056da792db46c728685a2d1caf4ead072e6713848c2f612'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/deck/releases/download/v1.17.3/deck_v1.17.3_darwin_amd64.zip'
      sha256 '4499ff4f8c2d8d68e0579a83b5569958c176c1391b3c2d49f725d6b8c1714a34'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/deck/releases/download/v1.17.3/deck_v1.17.3_linux_arm64.tar.gz'
      sha256 '4e148659e975121751fc57360b9791fb6e82aae086effff9a4331c81fae77991'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/deck/releases/download/v1.17.3/deck_v1.17.3_linux_amd64.tar.gz'
      sha256 '0cc5410ccfe8d0bbfc1e0589e5d6e69b668503691b39531f8af9c516eb4c8de7'
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
