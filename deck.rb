class Deck < Formula
  desc 'deck is a tool for creating deck using Google Slides.'
  version '0.38.0'
  homepage 'https://github.com/k1LoW/deck'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/deck/releases/download/v0.38.0/deck_v0.38.0_darwin_arm64.zip'
      sha256 '136b6f545a1b1242a4cb1592ef76071f4771cc0df037786095c4bf31dc94a338'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/deck/releases/download/v0.38.0/deck_v0.38.0_darwin_amd64.zip'
      sha256 '6683a5ec97dd4b0d655a5d59d11cd318f8d2631bef717c64ad9fc53dd8e10c43'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/deck/releases/download/v0.38.0/deck_v0.38.0_linux_arm64.tar.gz'
      sha256 '85c64c42fca31682947e3b1573ed1228f8ec043d7f4ba3b472354da7b32209cf'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/deck/releases/download/v0.38.0/deck_v0.38.0_linux_amd64.tar.gz'
      sha256 'c688a4db4de6aac8f1494fa81c99a89f858f2fc38f1dec06e5bbd4a048b99339'
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
