class Deck < Formula
  desc 'deck is a tool for creating deck using Google Slides.'
  version '0.8.0'
  homepage 'https://github.com/k1LoW/deck'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/deck/releases/download/v0.8.0/deck_v0.8.0_darwin_arm64.zip'
      sha256 '2a6efcab2855f2492dd66c638c83c282bc268a7e1affab743703d47062460511'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/deck/releases/download/v0.8.0/deck_v0.8.0_darwin_amd64.zip'
      sha256 '2692e9c31cc8e1cffca9e6cad119f6ce4520b0713e24f670744a2b5d9f7fa49e'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/deck/releases/download/v0.8.0/deck_v0.8.0_linux_arm64.tar.gz'
      sha256 '2bca049aeb9c701ccb9a39272e7797561886c093a8debd89f303759a795995de'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/deck/releases/download/v0.8.0/deck_v0.8.0_linux_amd64.tar.gz'
      sha256 '3ef977f29072201d0c06940c41e52ae65b2b0cf2c0ecc8643bc5ce13bd252c33'
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
