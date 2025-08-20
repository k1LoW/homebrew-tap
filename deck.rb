class Deck < Formula
  desc 'deck is a tool for creating deck using Google Slides.'
  version '1.15.2'
  homepage 'https://github.com/k1LoW/deck'

  deprecate! date: "2025-08-02", because: "please use the official Homebrew formula instead"

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/deck/releases/download/v1.15.2/deck_v1.15.2_darwin_arm64.zip'
      sha256 '4f2bce271658703d096cb933d6661c099d862308f2eb79d48a9bd80922391db8'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/deck/releases/download/v1.15.2/deck_v1.15.2_darwin_amd64.zip'
      sha256 '3d9a1953bb5a3d1e9ba56e3e2c9f955cfdd84e37d3fe1418cf2736b7f00120fe'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/deck/releases/download/v1.15.2/deck_v1.15.2_linux_arm64.tar.gz'
      sha256 '68a8d63ddfaee03cedb1690fb1605850e16d3d9c5b726c83533f541d82351809'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/deck/releases/download/v1.15.2/deck_v1.15.2_linux_amd64.tar.gz'
      sha256 'ee0de558dc1482a97abbd2b5ad928ec17bffd858826fdac065753d00b59a4f60'
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
