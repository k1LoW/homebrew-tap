class Deck < Formula
  desc 'deck is a tool for creating deck using Google Slides.'
  version '0.9.1'
  homepage 'https://github.com/k1LoW/deck'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/deck/releases/download/v0.9.1/deck_v0.9.1_darwin_arm64.zip'
      sha256 '9eb9a09e5782800ee1a2dffc97186c03cbf3570295dbc8844c6de723ffe330f1'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/deck/releases/download/v0.9.1/deck_v0.9.1_darwin_amd64.zip'
      sha256 '6613d5d14c24d715d79f8e2c16f12b22ef3d5fe58c4d3ace54de628156a0cd60'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/deck/releases/download/v0.9.1/deck_v0.9.1_linux_arm64.tar.gz'
      sha256 '0b78df1a98d7072398693824ac62a7e1db4636e7e50fced5f9eca94b37e909e8'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/deck/releases/download/v0.9.1/deck_v0.9.1_linux_amd64.tar.gz'
      sha256 '7d1eb5705190462de98a13247c15f68dba30b77e4d471abb9184088f87369671'
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
