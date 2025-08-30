class Deck < Formula
  desc 'deck is a tool for creating deck using Google Slides.'
  version '1.18.0'
  homepage 'https://github.com/k1LoW/deck'

  deprecate! date: "2025-08-02", because: "please use the official Homebrew formula instead"

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/deck/releases/download/v1.18.0/deck_v1.18.0_darwin_arm64.zip'
      sha256 '767ca049ac311011e689393dfccddda2a2e5c8bb4a80d1de97a924199085ee94'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/deck/releases/download/v1.18.0/deck_v1.18.0_darwin_amd64.zip'
      sha256 'a301a3b41638d88bbdbfe749df564bd98843e4ca472e6bd5e1518539fde533c2'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/deck/releases/download/v1.18.0/deck_v1.18.0_linux_arm64.tar.gz'
      sha256 '9eb75d5625eec1dffccb452a3b2b49f3b4be794d95745bb9784b52e08e9e4de2'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/deck/releases/download/v1.18.0/deck_v1.18.0_linux_amd64.tar.gz'
      sha256 '9323ebd3d6585d1a3e72421d5adb9d4b1e47359baf7831fac1166221e04bff30'
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
