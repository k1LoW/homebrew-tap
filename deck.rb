class Deck < Formula
  desc 'deck is a tool for creating deck using Google Slides.'
  version '1.19.2'
  homepage 'https://github.com/k1LoW/deck'

  deprecate! date: "2025-08-02", because: "please use the official Homebrew formula instead"

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/deck/releases/download/v1.19.2/deck_v1.19.2_darwin_arm64.zip'
      sha256 '6ad493088135d1e455766d77feb3e98296356515b9d13b0c6adbec113cfbc76b'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/deck/releases/download/v1.19.2/deck_v1.19.2_darwin_amd64.zip'
      sha256 'f2f0367d9a2d021334aba12c4bc5dfedb49f7e6613a7eaed9639bc587e2929f1'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/deck/releases/download/v1.19.2/deck_v1.19.2_linux_arm64.tar.gz'
      sha256 'a8f27f466743a609ec664c22ae395247d1d8f2adf5f6ee3ed5320049956c059f'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/deck/releases/download/v1.19.2/deck_v1.19.2_linux_amd64.tar.gz'
      sha256 'b9245e402b051412bd4da47b7bc0219a12ebc947c541be9c1527c7ee15672aa4'
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
