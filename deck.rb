class Deck < Formula
  desc 'deck is a tool for creating deck using Google Slides.'
  version '1.16.0'
  homepage 'https://github.com/k1LoW/deck'

  deprecate! date: "2025-08-02", because: "please use the official Homebrew formula instead"

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/deck/releases/download/v1.16.0/deck_v1.16.0_darwin_arm64.zip'
      sha256 '9a516d801c927ab60993dfa4b78b3d73b910e2ea0705d9299f2d1f9f63a567eb'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/deck/releases/download/v1.16.0/deck_v1.16.0_darwin_amd64.zip'
      sha256 '2ffee8ef17364302cfe1bf5b52edc90481a4ec5eef3e5bd0261582e07571d220'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/deck/releases/download/v1.16.0/deck_v1.16.0_linux_arm64.tar.gz'
      sha256 '9cf3ebe02c7d13ed9afa609d4450b62e27427b276026534259894ef3d76177d9'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/deck/releases/download/v1.16.0/deck_v1.16.0_linux_amd64.tar.gz'
      sha256 'dbb3d01b6888866fe5b0d7bea10d36f40302470292772b435d8856de7800d933'
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
