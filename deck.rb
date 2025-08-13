class Deck < Formula
  desc 'deck is a tool for creating deck using Google Slides.'
  version '1.13.0'
  homepage 'https://github.com/k1LoW/deck'

  deprecate! date: "2025-08-02", because: "please use the official Homebrew formula instead"

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/deck/releases/download/v1.13.0/deck_v1.13.0_darwin_arm64.zip'
      sha256 '5e123d01ae47a9382c8e3e636f1874e29fb4ab39fa6f1a295e978c1daacf20ef'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/deck/releases/download/v1.13.0/deck_v1.13.0_darwin_amd64.zip'
      sha256 '2562ee0b8d1b5d8b68258a7c8b03631066ee86e3250006422d932c0728b27b54'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/deck/releases/download/v1.13.0/deck_v1.13.0_linux_arm64.tar.gz'
      sha256 '15c711289bd7669b0e988b2de24886df8d67318f1137a51dd126e8cdfc0036f8'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/deck/releases/download/v1.13.0/deck_v1.13.0_linux_amd64.tar.gz'
      sha256 'ff12a860816d6b4998edd2b2b9adf454a80e50000d471fa13a4a14f1d5dd801e'
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
