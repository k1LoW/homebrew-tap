class Deck < Formula
  desc 'deck is a tool for creating deck using Google Slides.'
  version '1.15.0'
  homepage 'https://github.com/k1LoW/deck'

  deprecate! date: "2025-08-02", because: "please use the official Homebrew formula instead"

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/deck/releases/download/v1.15.0/deck_v1.15.0_darwin_arm64.zip'
      sha256 'b43fdee6a163acac92ba966adf30d1c5711463545a9d32b1072a41e15aabcb5f'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/deck/releases/download/v1.15.0/deck_v1.15.0_darwin_amd64.zip'
      sha256 '7dc7150a6286b8051602c8a34410225879611decc73bf8822d7e5b201117dc80'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/deck/releases/download/v1.15.0/deck_v1.15.0_linux_arm64.tar.gz'
      sha256 'a4034fae3faa1463f87a7f5830c241170c05b56b2aa9058e5ca3b6a61f3b9b75'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/deck/releases/download/v1.15.0/deck_v1.15.0_linux_amd64.tar.gz'
      sha256 '0044d6b6ab9992297974c99d162faf75ddfe6f9836cc72919ed245ec946508a5'
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
