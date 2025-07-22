class Deck < Formula
  desc 'deck is a tool for creating deck using Google Slides.'
  version '1.2.0'
  homepage 'https://github.com/k1LoW/deck'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/deck/releases/download/v1.2.0/deck_v1.2.0_darwin_arm64.zip'
      sha256 '484c8230301dc6a31b4d9a3623d66b97fdb8e39f4f7655ebd71192d98a9d81ea'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/deck/releases/download/v1.2.0/deck_v1.2.0_darwin_amd64.zip'
      sha256 '712439ab4e7dcda451873e4d483c6b911396ae4eb27661ab6da1519461c3f0c5'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/deck/releases/download/v1.2.0/deck_v1.2.0_linux_arm64.tar.gz'
      sha256 'b62605e63b28f9afd1542d975ebf31ae7bd9d0afa565395fa656021fe1295824'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/deck/releases/download/v1.2.0/deck_v1.2.0_linux_amd64.tar.gz'
      sha256 'c1b04263d47546a7f0b5557862125ba82cba8aedf7b6f51691ec355bb8d41d96'
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
