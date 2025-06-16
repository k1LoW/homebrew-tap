class Deck < Formula
  desc 'deck is a tool for creating deck using Google Slides.'
  version '0.22.1'
  homepage 'https://github.com/k1LoW/deck'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/deck/releases/download/v0.22.1/deck_v0.22.1_darwin_arm64.zip'
      sha256 'fb57c764b2718d40f77a8ac5ec510dccfb318887043b0a119e1336a32001082c'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/deck/releases/download/v0.22.1/deck_v0.22.1_darwin_amd64.zip'
      sha256 'a45e114b5d9610793418c5a4c61fa4fc1932fcd83112e82ac631479b4beedf74'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/deck/releases/download/v0.22.1/deck_v0.22.1_linux_arm64.tar.gz'
      sha256 '6096ff65d9e503ad7904a7c970c79a80a694462bdae6516ff89a87529a665054'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/deck/releases/download/v0.22.1/deck_v0.22.1_linux_amd64.tar.gz'
      sha256 '0c4c944566ddc46b854178bbcf4e29aeb5013bd26e6ba6ec05454f4a4b58d055'
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
