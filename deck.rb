class Deck < Formula
  desc 'deck is a tool for creating deck using Google Slides.'
  version '1.24.0'
  homepage 'https://github.com/k1LoW/deck'

  deprecate! date: "2025-08-02", because: "please use the official Homebrew formula instead"

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/deck/releases/download/v1.24.0/deck_v1.24.0_darwin_arm64.zip'
      sha256 '7cdbdf6936faeb1a9b8ddd675078272564069ad4348577f69e0a20e634c3d426'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/deck/releases/download/v1.24.0/deck_v1.24.0_darwin_amd64.zip'
      sha256 '9fa7dcdacf43e5847c9047f2780089f0074b7cd4f802858dd4573bbde371b5d5'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/deck/releases/download/v1.24.0/deck_v1.24.0_linux_arm64.tar.gz'
      sha256 '59b9f4c30d86ccd081de7e2df93c196ffe2442b66ff629a395100352d384b461'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/deck/releases/download/v1.24.0/deck_v1.24.0_linux_amd64.tar.gz'
      sha256 'e53886a71786f7f82bca378808a5de38bf9721376dd2db8b7a3dbbec08cc23a1'
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
