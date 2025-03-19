class Deck < Formula
  desc 'deck is a tool for creating deck using Google Slides.'
  version '0.10.1'
  homepage 'https://github.com/k1LoW/deck'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/deck/releases/download/v0.10.1/deck_v0.10.1_darwin_arm64.zip'
      sha256 'd3d1f3ba46a0f95ea346a94e5e9a6f6bc160cb83f06ffe26e947988f4625cd1f'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/deck/releases/download/v0.10.1/deck_v0.10.1_darwin_amd64.zip'
      sha256 '49b0d0fb93c159753152b2f20fcb36f29bf9a209db2f9ff5d8c15324ea24a8a1'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/deck/releases/download/v0.10.1/deck_v0.10.1_linux_arm64.tar.gz'
      sha256 '183d333b46e00856d1791b1fa5693b28beaa9944a746f8ebc50fc2a83eadb14c'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/deck/releases/download/v0.10.1/deck_v0.10.1_linux_amd64.tar.gz'
      sha256 'be42c511efcb9ce7e9c7dd7151ea35e9f8a48dbbd22b941249cecf7cd1ae8202'
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
