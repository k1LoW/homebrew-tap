class Deck < Formula
  desc 'deck is a tool for creating deck using Google Slides.'
  version '1.8.0'
  homepage 'https://github.com/k1LoW/deck'

  deprecate! date: "2025-08-02", because: "please use the official Homebrew formula instead"

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/deck/releases/download/v1.8.0/deck_v1.8.0_darwin_arm64.zip'
      sha256 '2a8518a4078ffee63340637b5705c4e2e31cf83114996dd43a348bda3607d39b'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/deck/releases/download/v1.8.0/deck_v1.8.0_darwin_amd64.zip'
      sha256 '6ef65777e46606cc6eb642cacf221352612b7abf93989afef9157cbbd48675f9'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/deck/releases/download/v1.8.0/deck_v1.8.0_linux_arm64.tar.gz'
      sha256 '1ccf1333bf7c869ee88f9aa433186b540af504d302ae08720f523cbe921954b6'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/deck/releases/download/v1.8.0/deck_v1.8.0_linux_amd64.tar.gz'
      sha256 '7e294903d3db90d703e24378d2eef71485744317469e95caab364fb4b245e631'
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
