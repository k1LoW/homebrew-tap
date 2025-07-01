class Deck < Formula
  desc 'deck is a tool for creating deck using Google Slides.'
  version '0.31.2'
  homepage 'https://github.com/k1LoW/deck'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/deck/releases/download/v0.31.2/deck_v0.31.2_darwin_arm64.zip'
      sha256 'eaa92b44e1ed02623053032720e45b6901bad1e68d12c7002a84c8418240f4e3'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/deck/releases/download/v0.31.2/deck_v0.31.2_darwin_amd64.zip'
      sha256 'e1150fc3250f5fc5cad1f0a0d6058835c77c7d625f3c9230d51a5c7b6e000411'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/deck/releases/download/v0.31.2/deck_v0.31.2_linux_arm64.tar.gz'
      sha256 '6a32d683aa7b19235c462d066562c455ab5997905c9f05b940ac19e9fa3c53f7'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/deck/releases/download/v0.31.2/deck_v0.31.2_linux_amd64.tar.gz'
      sha256 '023b628947ae1a4e7ea8204206d1e2c1310e429fd09c37fe1f51a6eaf5a76e2c'
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
