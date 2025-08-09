class Deck < Formula
  desc 'deck is a tool for creating deck using Google Slides.'
  version '1.10.1'
  homepage 'https://github.com/k1LoW/deck'

  deprecate! date: "2025-08-02", because: "please use the official Homebrew formula instead"

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/deck/releases/download/v1.10.1/deck_v1.10.1_darwin_arm64.zip'
      sha256 'b57b8f2fd32ddba3d4d53d83d926fd7b2644c68ecf47e46c2d3add4399d86481'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/deck/releases/download/v1.10.1/deck_v1.10.1_darwin_amd64.zip'
      sha256 '3c209b084fea6328461c448849474fdd29c614fdcab672e4adde4924f1522d64'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/deck/releases/download/v1.10.1/deck_v1.10.1_linux_arm64.tar.gz'
      sha256 'f33ac020c9d8cd86172ddfaf265291af29809a9ade1c383bb425fc829a3e2617'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/deck/releases/download/v1.10.1/deck_v1.10.1_linux_amd64.tar.gz'
      sha256 'ceff7b47260ff057186c55ca1ee74def5fc25e3746c0e1a0ef5816b6155cb71c'
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
