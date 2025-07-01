class Deck < Formula
  desc 'deck is a tool for creating deck using Google Slides.'
  version '0.33.0'
  homepage 'https://github.com/k1LoW/deck'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/deck/releases/download/v0.33.0/deck_v0.33.0_darwin_arm64.zip'
      sha256 'c7f8f340780131be588834fae926b41d6e1233edd7248e827fe3401c42bd4c55'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/deck/releases/download/v0.33.0/deck_v0.33.0_darwin_amd64.zip'
      sha256 '1538ddd562af3a1ca8860bf7fd40ba2fde52847df9bd18bbe254183bcaa5a4f9'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/deck/releases/download/v0.33.0/deck_v0.33.0_linux_arm64.tar.gz'
      sha256 '6b535572ba0ef5f7281c64aafad559eff12fe4d468a7e245e67de7466994cf04'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/deck/releases/download/v0.33.0/deck_v0.33.0_linux_amd64.tar.gz'
      sha256 '172e1270df4c350e0f301712460d94ab78f75680278cf2745b055e11b3e8bf18'
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
