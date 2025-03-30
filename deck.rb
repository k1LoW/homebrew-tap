class Deck < Formula
  desc 'deck is a tool for creating deck using Google Slides.'
  version '0.13.1'
  homepage 'https://github.com/k1LoW/deck'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/deck/releases/download/v0.13.1/deck_v0.13.1_darwin_arm64.zip'
      sha256 '55711820d3004098d4cbce1c43a769ea1c5159c965313db4847fbffb3a6b730e'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/deck/releases/download/v0.13.1/deck_v0.13.1_darwin_amd64.zip'
      sha256 '39df65602fa6ce4af037df8bd53aa1981edd8f3b9f0cfdd839b3e834a8a6d96c'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/deck/releases/download/v0.13.1/deck_v0.13.1_linux_arm64.tar.gz'
      sha256 '2136ee6df028fe8fd738750ed80c1a8f6f33bacd435e9feb09989617852907d8'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/deck/releases/download/v0.13.1/deck_v0.13.1_linux_amd64.tar.gz'
      sha256 '68f5c3c073b8c07882fa78f02bf7f06739e4a5c82362c572c01f6f1b03caef4d'
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
