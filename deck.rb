class Deck < Formula
  desc 'deck is a tool for creating deck using Google Slides.'
  version '1.19.0'
  homepage 'https://github.com/k1LoW/deck'

  deprecate! date: "2025-08-02", because: "please use the official Homebrew formula instead"

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/deck/releases/download/v1.19.0/deck_v1.19.0_darwin_arm64.zip'
      sha256 'f2ed3e93641fc270029b1597b88f0a8baa5d2f6f984a729a2eae6198542af514'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/deck/releases/download/v1.19.0/deck_v1.19.0_darwin_amd64.zip'
      sha256 '506fe9a5f186e5aa6722fd35d005ff2b76ed50a528e266dcbbbd4090e04032ba'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/deck/releases/download/v1.19.0/deck_v1.19.0_linux_arm64.tar.gz'
      sha256 'c82405e77c777a20fc89388c8e9a53d9cb8f75f55715f8bd32343fd6d50709de'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/deck/releases/download/v1.19.0/deck_v1.19.0_linux_amd64.tar.gz'
      sha256 'b50785dda02fdbb33a10cfc479760d5b46acd50d345c741cd75a1277c3eb6d49'
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
