class Deck < Formula
  desc 'deck is a tool for creating deck using Google Slides.'
  version '0.10.3'
  homepage 'https://github.com/k1LoW/deck'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/deck/releases/download/v0.10.3/deck_v0.10.3_darwin_arm64.zip'
      sha256 '0fc94f6f3d8c0c9aaa871c73f1e0d8c7bf1c203caff6fb3258064d55384613cd'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/deck/releases/download/v0.10.3/deck_v0.10.3_darwin_amd64.zip'
      sha256 'ece52d7150d025920c1def2d27c107bf267527f144b0759d05525fcf5f1d4ad5'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/deck/releases/download/v0.10.3/deck_v0.10.3_linux_arm64.tar.gz'
      sha256 '430fa8b0eaa72cb1fac2608ec8b5dd73ab7d34b3fc1f3277cd4098070761b770'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/deck/releases/download/v0.10.3/deck_v0.10.3_linux_amd64.tar.gz'
      sha256 '1b4239599d3a161a61905c76e6bf28ef1eb3c318ae5582c4797c9c3c9a0a54b4'
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
