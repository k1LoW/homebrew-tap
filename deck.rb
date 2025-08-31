class Deck < Formula
  desc 'deck is a tool for creating deck using Google Slides.'
  version '1.19.1'
  homepage 'https://github.com/k1LoW/deck'

  deprecate! date: "2025-08-02", because: "please use the official Homebrew formula instead"

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/deck/releases/download/v1.19.1/deck_v1.19.1_darwin_arm64.zip'
      sha256 'c214172d5c386b091b62973b8eaf10f288e64291f8b7ffcfbb0a17307a507c38'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/deck/releases/download/v1.19.1/deck_v1.19.1_darwin_amd64.zip'
      sha256 '8927ddf885c627a8bb5a2f44bd16bde09112d24a7efae186ca4bd7cd565d4de8'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/deck/releases/download/v1.19.1/deck_v1.19.1_linux_arm64.tar.gz'
      sha256 'bcc9716bbad1243d0a97ee77fbd869d175a2c79c35dfb6eee7e3587c21d3ddc5'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/deck/releases/download/v1.19.1/deck_v1.19.1_linux_amd64.tar.gz'
      sha256 '56825c19b430bd2b3632bf5de359e363c09ab7497db001ced87593cd4ccc40ad'
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
