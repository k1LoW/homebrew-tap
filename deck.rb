class Deck < Formula
  desc 'deck is a tool for creating deck using Google Slides.'
  version '0.13.2'
  homepage 'https://github.com/k1LoW/deck'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/deck/releases/download/v0.13.2/deck_v0.13.2_darwin_arm64.zip'
      sha256 '9cb16224c19749ec574cc5af42f5b076de7bb1d19e4f467dad693a4e27bbc87c'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/deck/releases/download/v0.13.2/deck_v0.13.2_darwin_amd64.zip'
      sha256 '4a8671ca58f270c4333d17caef7d77b81130b0bf8cbd0ecfd7a2a8f37aa13210'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/deck/releases/download/v0.13.2/deck_v0.13.2_linux_arm64.tar.gz'
      sha256 '5164f73f6f457f33e8145ab2f4131cd7d2c6e10c8a07c2d9540f2d1e49e50011'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/deck/releases/download/v0.13.2/deck_v0.13.2_linux_amd64.tar.gz'
      sha256 'd632b3c3c3e250ae4b937996d85a00d326b6dd54431f8a7a4faa20a3d7ec4f12'
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
