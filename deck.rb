class Deck < Formula
  desc 'deck is a tool for creating deck using Google Slides.'
  version '1.1.0'
  homepage 'https://github.com/k1LoW/deck'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/deck/releases/download/v1.1.0/deck_v1.1.0_darwin_arm64.zip'
      sha256 '873964d9e70dce0afdade514c01ae816a1dc55a725a1207846961afb309cf1a9'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/deck/releases/download/v1.1.0/deck_v1.1.0_darwin_amd64.zip'
      sha256 '2a9ad18b0fd60b7f66dedddfdb8d5b642ecca4cf64b090bf574a3e6d23bc704e'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/deck/releases/download/v1.1.0/deck_v1.1.0_linux_arm64.tar.gz'
      sha256 'e35f3c6cc8642ac55b8caee2a1b1e9f38dc2aa974f54a4c62c1ff63c4f0e9946'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/deck/releases/download/v1.1.0/deck_v1.1.0_linux_amd64.tar.gz'
      sha256 'b8b0e38f046f1e028d4d2ee97eb41c369b0a1565ac1367c600e59f003999d50f'
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
