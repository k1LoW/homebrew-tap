class Deck < Formula
  desc 'deck is a tool for creating deck using Google Slides.'
  version '0.42.1'
  homepage 'https://github.com/k1LoW/deck'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/deck/releases/download/v0.42.1/deck_v0.42.1_darwin_arm64.zip'
      sha256 'd16ac31d07b3cb250b6699b6b5f71545cfaea5d9363bb59ff243f111a8141e79'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/deck/releases/download/v0.42.1/deck_v0.42.1_darwin_amd64.zip'
      sha256 '33b300df20720b6ec489007c3b8e488140f1707b4f520f16a9abce544cf4057a'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/deck/releases/download/v0.42.1/deck_v0.42.1_linux_arm64.tar.gz'
      sha256 'b349fe8025e3d8e24c26b1d8a3e2c74a2afcd7d133e218767c27e34918922793'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/deck/releases/download/v0.42.1/deck_v0.42.1_linux_amd64.tar.gz'
      sha256 'bb80fdf58687c7d9bc117fbad027710e65b224bb715712475e07e7ee91500393'
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
