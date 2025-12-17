class Deck < Formula
  desc 'deck is a tool for creating deck using Google Slides.'
  version '1.22.0'
  homepage 'https://github.com/k1LoW/deck'

  deprecate! date: "2025-08-02", because: "please use the official Homebrew formula instead"

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/deck/releases/download/v1.22.0/deck_v1.22.0_darwin_arm64.zip'
      sha256 '21035332dc475f4ca778e66ef012bc2400cfb1197c816a26d8539ac01b6406a9'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/deck/releases/download/v1.22.0/deck_v1.22.0_darwin_amd64.zip'
      sha256 '347a20e3292141c32de1e62bd66a0782b91123f271e48c481d67e2cfa305a375'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/deck/releases/download/v1.22.0/deck_v1.22.0_linux_arm64.tar.gz'
      sha256 '7cf16fc6451177858e23f1afcfd80827fb93b7f4f8523969822ce70ced2c2200'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/deck/releases/download/v1.22.0/deck_v1.22.0_linux_amd64.tar.gz'
      sha256 'b42317bd57a2a11ba85663a31705a04b953c4510067e16b7e54844798ee0f516'
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
