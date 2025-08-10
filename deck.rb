class Deck < Formula
  desc 'deck is a tool for creating deck using Google Slides.'
  version '1.11.0'
  homepage 'https://github.com/k1LoW/deck'

  deprecate! date: "2025-08-02", because: "please use the official Homebrew formula instead"

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/deck/releases/download/v1.11.0/deck_v1.11.0_darwin_arm64.zip'
      sha256 '4a50eba442a58a68a04736ae281c900c82890a9dedc402a147cc17e72e74f902'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/deck/releases/download/v1.11.0/deck_v1.11.0_darwin_amd64.zip'
      sha256 '990d7db459b594149436a2eaaed85e2951900a889fe91ef49cc1a3a3366b032b'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/deck/releases/download/v1.11.0/deck_v1.11.0_linux_arm64.tar.gz'
      sha256 'f9dd9567a3aeb738ebbf8b894e9a4a99ea0b1057caf5e21d2b1481d367e00ebd'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/deck/releases/download/v1.11.0/deck_v1.11.0_linux_amd64.tar.gz'
      sha256 '77703af570e963628d0c6bd54012d51cfe214ee923efa6b788b10eedd2b5e067'
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
