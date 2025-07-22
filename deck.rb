class Deck < Formula
  desc 'deck is a tool for creating deck using Google Slides.'
  version '1.2.1'
  homepage 'https://github.com/k1LoW/deck'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/deck/releases/download/v1.2.1/deck_v1.2.1_darwin_arm64.zip'
      sha256 '70b3be198492e5be2ea5a920f2e05fd1ff5e566dc1756384b19a3958b4975904'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/deck/releases/download/v1.2.1/deck_v1.2.1_darwin_amd64.zip'
      sha256 'd9125fdba8ae38b765c92aabb2fc0556e437e4301a4db8dfd0de7291fe98e3aa'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/deck/releases/download/v1.2.1/deck_v1.2.1_linux_arm64.tar.gz'
      sha256 '8b89d7ddf4fb45ff54cd9d6f5bf9bdc337bf5d3683a29bd77cff08241bf10889'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/deck/releases/download/v1.2.1/deck_v1.2.1_linux_amd64.tar.gz'
      sha256 '4da0f7b1bcb165cd4578c8161329b85c1f0b6e6dd120a2a691cb947b67e802a5'
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
