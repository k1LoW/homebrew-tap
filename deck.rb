class Deck < Formula
  desc 'deck is a tool for creating deck using Google Slides.'
  version '0.26.0'
  homepage 'https://github.com/k1LoW/deck'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/deck/releases/download/v0.26.0/deck_v0.26.0_darwin_arm64.zip'
      sha256 'eec5be609b8ead5b62fd0142e884d9917deb4d6c880934c2a482f9fa045a7c2f'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/deck/releases/download/v0.26.0/deck_v0.26.0_darwin_amd64.zip'
      sha256 '2b319fc40b23d9d623f22febbe523a66df900b9a398d5ac7258a173e8d4ec074'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/deck/releases/download/v0.26.0/deck_v0.26.0_linux_arm64.tar.gz'
      sha256 '873a6db485120b6d43fe15cfaeba4da0c524b99e68d497a723311ed68c8f3d59'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/deck/releases/download/v0.26.0/deck_v0.26.0_linux_amd64.tar.gz'
      sha256 '546625711cda37287651c73e57165e98ef8eeb207bc0c8276ed8c561cf972ddc'
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
