class Deck < Formula
  desc 'deck is a tool for creating deck using Google Slides.'
  version '1.21.5'
  homepage 'https://github.com/k1LoW/deck'

  deprecate! date: "2025-08-02", because: "please use the official Homebrew formula instead"

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/deck/releases/download/v1.21.5/deck_v1.21.5_darwin_arm64.zip'
      sha256 'da35f90afe1d5f020fe304a9876aa2ec350e8bcceab6d1b013037ab73a17a4ca'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/deck/releases/download/v1.21.5/deck_v1.21.5_darwin_amd64.zip'
      sha256 'e534dba1441efb4ed246758abb5525bb6b86139c80874bf7453f963c599eb61e'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/deck/releases/download/v1.21.5/deck_v1.21.5_linux_arm64.tar.gz'
      sha256 '83b80c6c0454deb26c1f21d5d45a1a2ff538774d2baffd1bb1bc32565d1b05ce'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/deck/releases/download/v1.21.5/deck_v1.21.5_linux_amd64.tar.gz'
      sha256 '2e2cb28c5fbdfafc356ad5ac1479a6ef66fcb413e92b8a032c5e59c551121276'
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
