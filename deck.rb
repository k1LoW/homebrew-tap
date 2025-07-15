class Deck < Formula
  desc 'deck is a tool for creating deck using Google Slides.'
  version '0.41.0'
  homepage 'https://github.com/k1LoW/deck'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/deck/releases/download/v0.41.0/deck_v0.41.0_darwin_arm64.zip'
      sha256 '52643c24576b1d9d3adba771d90b4a16577e0cfb11b4a5355a6a304fdc7ae210'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/deck/releases/download/v0.41.0/deck_v0.41.0_darwin_amd64.zip'
      sha256 '17c1c34dd74ba4fdf873e1536121dc51e790d9e41edd7ac534fa45db3d00ed8f'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/deck/releases/download/v0.41.0/deck_v0.41.0_linux_arm64.tar.gz'
      sha256 'bbaf4bd3346f0d8ac88b75d59f8f87b94bdea949efa2a53c4213e3de493902ad'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/deck/releases/download/v0.41.0/deck_v0.41.0_linux_amd64.tar.gz'
      sha256 '6016b19fffde64f409f53212415d63e1f2b28d8ec3e7097e09edc559985372e0'
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
