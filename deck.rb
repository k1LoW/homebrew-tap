class Deck < Formula
  desc 'deck is a tool for creating deck using Google Slides.'
  version '0.20.0'
  homepage 'https://github.com/k1LoW/deck'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/deck/releases/download/v0.20.0/deck_v0.20.0_darwin_arm64.zip'
      sha256 'c0afbf3651c73f051954b29b1088df126661f6b349db8cb9d90752d6acd669ab'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/deck/releases/download/v0.20.0/deck_v0.20.0_darwin_amd64.zip'
      sha256 'a038995fcbe02a94efec00d49945a92cbdc684dd14e2fc2f76ecd03e25b6c6cf'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/deck/releases/download/v0.20.0/deck_v0.20.0_linux_arm64.tar.gz'
      sha256 '978cb1684d36a44413f18db4ce8ed3078d5be7a54e504bab3399c5279dad8444'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/deck/releases/download/v0.20.0/deck_v0.20.0_linux_amd64.tar.gz'
      sha256 '19ce3e2a3ed70472df61963f528bd8bedfc53ec5d32b2c97d6094ccceaa94d42'
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
