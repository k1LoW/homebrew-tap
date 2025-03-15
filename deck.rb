class Deck < Formula
  desc 'deck is a tool for creating deck using Google Slides.'
  version '0.6.0'
  homepage 'https://github.com/k1LoW/deck'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/deck/releases/download/v0.6.0/deck_v0.6.0_darwin_arm64.zip'
      sha256 'a89a9698695164297cde0d7da63a25d59470a60ff8c2262d53f68f51776045ef'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/deck/releases/download/v0.6.0/deck_v0.6.0_darwin_amd64.zip'
      sha256 '10e8db32c288eeb5529391cf35d32696776ca2c0fe29e4c3b3ad1b02d80eb59b'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/deck/releases/download/v0.6.0/deck_v0.6.0_linux_arm64.tar.gz'
      sha256 'e8c29e1cbd1633221e43dc9345de46b1f3c2391cd63be0fa3da7546b28bb46f7'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/deck/releases/download/v0.6.0/deck_v0.6.0_linux_amd64.tar.gz'
      sha256 '2a2d4497a221ee1fcb769f2acd9155f590c96d0744a4d1e478d7158aca4d025b'
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
