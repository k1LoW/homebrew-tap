class Deck < Formula
  desc 'deck is a tool for creating deck using Google Slides.'
  version '0.43.0'
  homepage 'https://github.com/k1LoW/deck'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/deck/releases/download/v0.43.0/deck_v0.43.0_darwin_arm64.zip'
      sha256 'f08f4b3fcdc8a2c0217119f2895e46cdb89fc62ad55c6f8214ded446cd79c82e'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/deck/releases/download/v0.43.0/deck_v0.43.0_darwin_amd64.zip'
      sha256 '4c0c70bf70ff5d717c7943ce731360d4410f928e4f042dfb553fa3bdc97f6adb'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/deck/releases/download/v0.43.0/deck_v0.43.0_linux_arm64.tar.gz'
      sha256 '48fa628aa44f56bac8f46fd03cb8536d94428231c55bd30acef3cfbbced2dd72'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/deck/releases/download/v0.43.0/deck_v0.43.0_linux_amd64.tar.gz'
      sha256 '9f607d4af2c1e3b47b83e4b19a4864a92b8f14b79c94a0d60223c58297a6df42'
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
