class Deck < Formula
  desc 'deck is a tool for creating deck using Google Slides.'
  version '0.2.0'
  homepage 'https://github.com/k1LoW/deck'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/deck/releases/download/v0.2.0/deck_v0.2.0_darwin_arm64.zip'
      sha256 '504edea9a399719b0ddf266acdcf129c9dc9cf8e2e6b92804f97b0404a65359e'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/deck/releases/download/v0.2.0/deck_v0.2.0_darwin_amd64.zip'
      sha256 '4b1bcd18fc7b4c194d9dfdd4ee418465801e6e09637afc97fbb586d7164841f3'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/deck/releases/download/v0.2.0/deck_v0.2.0_linux_arm64.tar.gz'
      sha256 '33fd743cbc6861f02ef188e1fc3df2a8e3b84a48d1972b78b29b2d284079c18e'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/deck/releases/download/v0.2.0/deck_v0.2.0_linux_amd64.tar.gz'
      sha256 'c7e594494d2c1a2a4ec4706fa67dccf5684716f575f909beda9aad97ce281d2a'
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
