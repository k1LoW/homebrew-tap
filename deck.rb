class Deck < Formula
  desc 'deck is a tool for creating deck using Google Slides.'
  version '1.20.0'
  homepage 'https://github.com/k1LoW/deck'

  deprecate! date: "2025-08-02", because: "please use the official Homebrew formula instead"

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/deck/releases/download/v1.20.0/deck_v1.20.0_darwin_arm64.zip'
      sha256 '11d4d44422ab35234e2192effd24905d6b716f784a03da45d0bbb912a3cff7e0'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/deck/releases/download/v1.20.0/deck_v1.20.0_darwin_amd64.zip'
      sha256 '67ed575989b6cf0b80ba3d16e95e3c355e048b7f7e49089325a62f3ed39dd8f3'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/deck/releases/download/v1.20.0/deck_v1.20.0_linux_arm64.tar.gz'
      sha256 'b87acd8ab5beb9b2e5334b9bc71e8e0ed79403ed21f7242619ebc6901de9473e'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/deck/releases/download/v1.20.0/deck_v1.20.0_linux_amd64.tar.gz'
      sha256 'fff7646139bcdb316d799ddc1f2d53c4f6918ef0bcb515003acc7066871caa00'
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
