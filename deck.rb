class Deck < Formula
  desc 'deck is a tool for creating deck using Google Slides.'
  version '1.21.0'
  homepage 'https://github.com/k1LoW/deck'

  deprecate! date: "2025-08-02", because: "please use the official Homebrew formula instead"

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/deck/releases/download/v1.21.0/deck_v1.21.0_darwin_arm64.zip'
      sha256 'c3a593710653c327f7abbf2f2bef76a602eb77d60a457618c3cd4aff62b815cb'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/deck/releases/download/v1.21.0/deck_v1.21.0_darwin_amd64.zip'
      sha256 'e1d02ebb8a8e1a5565ae1d29107b6cf22c1b456ad6b19d7ac18e62309f137665'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/deck/releases/download/v1.21.0/deck_v1.21.0_linux_arm64.tar.gz'
      sha256 'ed7a76dafea3992e27373029f227d0640720e1ba39bb201602714ff438096594'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/deck/releases/download/v1.21.0/deck_v1.21.0_linux_amd64.tar.gz'
      sha256 '84843d68e4eb1f45a8042cb0003794c19df6a5833cdf813f4c7a44fa3103c100'
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
