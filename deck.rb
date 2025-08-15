class Deck < Formula
  desc 'deck is a tool for creating deck using Google Slides.'
  version '1.14.0'
  homepage 'https://github.com/k1LoW/deck'

  deprecate! date: "2025-08-02", because: "please use the official Homebrew formula instead"

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/deck/releases/download/v1.14.0/deck_v1.14.0_darwin_arm64.zip'
      sha256 'e581b839a712d437aa13d01e4c5712a4400ffcf84687bfd3d0284d41258c7d27'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/deck/releases/download/v1.14.0/deck_v1.14.0_darwin_amd64.zip'
      sha256 '2edb08995dfd99828a53ed40e75483f56fa6a4aaf591001617ddd8ecc70c8821'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/deck/releases/download/v1.14.0/deck_v1.14.0_linux_arm64.tar.gz'
      sha256 '94a9b403e21fa762b628b79eed7aeb95e5fe055943e2f6a91650118a4a87bb63'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/deck/releases/download/v1.14.0/deck_v1.14.0_linux_amd64.tar.gz'
      sha256 '371cf45fc142e41321e4ffb656626a618d10fa75056ea2d7fd9c7b9d8981f474'
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
