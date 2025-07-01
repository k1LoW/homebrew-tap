class Deck < Formula
  desc 'deck is a tool for creating deck using Google Slides.'
  version '0.31.1'
  homepage 'https://github.com/k1LoW/deck'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/deck/releases/download/v0.31.1/deck_v0.31.1_darwin_arm64.zip'
      sha256 'd57b2775fe6a8f96f219c887b2853edc8eec0844b849365d7ad8d2781b39cefc'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/deck/releases/download/v0.31.1/deck_v0.31.1_darwin_amd64.zip'
      sha256 '5b6e035b61f8258eea6dca7ae77223d9628c2f45eeee0d1d2215a75ea4f9afb9'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/deck/releases/download/v0.31.1/deck_v0.31.1_linux_arm64.tar.gz'
      sha256 '61d107fe6a1812ef26a42baa06671e9fd68e074dc29fb7862d551157d380845c'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/deck/releases/download/v0.31.1/deck_v0.31.1_linux_amd64.tar.gz'
      sha256 '4955f28b67bd167b3b08cfec5da4ea79b49b396c092c2b1603de37a22d6aee26'
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
