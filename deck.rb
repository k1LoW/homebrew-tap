class Deck < Formula
  desc 'deck is a tool for creating deck using Google Slides.'
  version '0.23.0'
  homepage 'https://github.com/k1LoW/deck'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/deck/releases/download/v0.23.0/deck_v0.23.0_darwin_arm64.zip'
      sha256 '7882297beefa78e1375493c164e0229be54b330ffe293563ee8c5782eec0d7b4'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/deck/releases/download/v0.23.0/deck_v0.23.0_darwin_amd64.zip'
      sha256 '7063766e2f671ec6b90942bcb9d6a7b1e10574a28a3374ea78d89d459caa696e'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/deck/releases/download/v0.23.0/deck_v0.23.0_linux_arm64.tar.gz'
      sha256 '5e4f2e4c5674bca6f2fa7739cf36c9cc5407900b1f5ed687bdccb966060522a3'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/deck/releases/download/v0.23.0/deck_v0.23.0_linux_amd64.tar.gz'
      sha256 '7ecf2ca994319a9477b21c12fd9d7aafbcf708e946ae6cb5d6ae1913980c1b19'
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
