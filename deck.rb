class Deck < Formula
  desc 'deck is a tool for creating deck using Google Slides.'
  version '0.30.0'
  homepage 'https://github.com/k1LoW/deck'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/deck/releases/download/v0.30.0/deck_v0.30.0_darwin_arm64.zip'
      sha256 '5e72f7a76f13e2afda9f3f17c9b2c38297be02cec5aaa75a68d7007639dde707'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/deck/releases/download/v0.30.0/deck_v0.30.0_darwin_amd64.zip'
      sha256 'dec10770d139ca4ee40cf9f512cf5336c94ca26259d1e31431df2308166bdf0c'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/deck/releases/download/v0.30.0/deck_v0.30.0_linux_arm64.tar.gz'
      sha256 'cb6cf9879d2464acb33a59d47838954b7cd7f3df63391901796000c70ec5cb95'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/deck/releases/download/v0.30.0/deck_v0.30.0_linux_amd64.tar.gz'
      sha256 'cba03aa682ac9a17fd3d434790aaa59478fe80721569f716e4c4bf74b7ee5188'
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
