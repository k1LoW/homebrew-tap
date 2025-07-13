class Deck < Formula
  desc 'deck is a tool for creating deck using Google Slides.'
  version '0.40.1'
  homepage 'https://github.com/k1LoW/deck'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/deck/releases/download/v0.40.1/deck_v0.40.1_darwin_arm64.zip'
      sha256 'c0573dcbab7772df04e4764845007bf6962c390c60c1e77f5f20b70f4b7491df'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/deck/releases/download/v0.40.1/deck_v0.40.1_darwin_amd64.zip'
      sha256 'ccc7b9fef1e481ed426f88434e71c90f1d8907a2382b14f5648fb2b85bf2ebf5'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/deck/releases/download/v0.40.1/deck_v0.40.1_linux_arm64.tar.gz'
      sha256 '66855c46945b0d4fe9a3584a053777a34919ed1dc8fd3d47f187f7d258003c6c'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/deck/releases/download/v0.40.1/deck_v0.40.1_linux_amd64.tar.gz'
      sha256 '1ba45cd5bbcc26639945e99dba4e7118dc3a385aeecd117a58a532058f4b3bea'
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
