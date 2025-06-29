class Deck < Formula
  desc 'deck is a tool for creating deck using Google Slides.'
  version '0.27.1'
  homepage 'https://github.com/k1LoW/deck'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/deck/releases/download/v0.27.1/deck_v0.27.1_darwin_arm64.zip'
      sha256 '90e2c5684ff4e0b1aac28d12ee11aa3ef806da267953900cbf2cd5426d093959'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/deck/releases/download/v0.27.1/deck_v0.27.1_darwin_amd64.zip'
      sha256 '8c70e41791c0cdf6e8f3643a37bd081259d7ae3e495055d773fa8921df9f9bfc'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/deck/releases/download/v0.27.1/deck_v0.27.1_linux_arm64.tar.gz'
      sha256 '08a52624d6e512e0ce5c67114806438885a681cd0bbcac843ee1c074ce5f2947'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/deck/releases/download/v0.27.1/deck_v0.27.1_linux_amd64.tar.gz'
      sha256 '1e1b60dbd6d7813f0a63e78f7a336eca744b13cfa697d8a04f85004940ff7e29'
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
