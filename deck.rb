class Deck < Formula
  desc 'deck is a tool for creating deck using Google Slides.'
  version '0.39.0'
  homepage 'https://github.com/k1LoW/deck'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/deck/releases/download/v0.39.0/deck_v0.39.0_darwin_arm64.zip'
      sha256 '8f50ef919331da2767851554653a8f30f2178652aa028a18c6724d0a2db893e6'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/deck/releases/download/v0.39.0/deck_v0.39.0_darwin_amd64.zip'
      sha256 'bb7433dafa4e800ecea309f334bdfe8e44a5b6b7238b031cd4196412d062b0b0'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/deck/releases/download/v0.39.0/deck_v0.39.0_linux_arm64.tar.gz'
      sha256 '79a50c704c728681a7f1f799071c519995a8f9f017f62abaa1bc0be95d7587ca'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/deck/releases/download/v0.39.0/deck_v0.39.0_linux_amd64.tar.gz'
      sha256 'ead19d6e916c86a59440069e2cf1f0ae9e1e1dd531db3efded21c3a7b7721ed5'
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
