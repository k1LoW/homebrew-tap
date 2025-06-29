class Deck < Formula
  desc 'deck is a tool for creating deck using Google Slides.'
  version '0.29.0'
  homepage 'https://github.com/k1LoW/deck'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/deck/releases/download/v0.29.0/deck_v0.29.0_darwin_arm64.zip'
      sha256 'dc8b72bff95dc33ca92a6aa84890bc6c0c0d46bfd454f44ba6ce0cca48f5a128'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/deck/releases/download/v0.29.0/deck_v0.29.0_darwin_amd64.zip'
      sha256 '4cc614052f0251003da6791381e92f385b12cae5e9c1d470d9ea19637d13779c'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/deck/releases/download/v0.29.0/deck_v0.29.0_linux_arm64.tar.gz'
      sha256 'fd395f684ed737fec02422ffb28ee6a6da0b6ed75390e8748a2cd1b09239d822'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/deck/releases/download/v0.29.0/deck_v0.29.0_linux_amd64.tar.gz'
      sha256 '1ad204c575fcd3dcdd6b0a1693103450ccc0d31d30c861b4f2be351e38e5edf7'
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
