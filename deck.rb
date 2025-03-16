class Deck < Formula
  desc 'deck is a tool for creating deck using Google Slides.'
  version '0.7.0'
  homepage 'https://github.com/k1LoW/deck'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/deck/releases/download/v0.7.0/deck_v0.7.0_darwin_arm64.zip'
      sha256 '8838dd11750bbf451c29f0094bb3e8002c30eeb18908691648b940dc7bf89073'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/deck/releases/download/v0.7.0/deck_v0.7.0_darwin_amd64.zip'
      sha256 '909545372ad5105b446bb68c51738b883e4d6f1148295a5419098891d363acda'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/deck/releases/download/v0.7.0/deck_v0.7.0_linux_arm64.tar.gz'
      sha256 'e15e041722ac50e97cd4d8bf7e7cc0b9127adba55030ebb7a0f4b72340a36a31'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/deck/releases/download/v0.7.0/deck_v0.7.0_linux_amd64.tar.gz'
      sha256 '562b542c53b2d2e81e8a6e6f6c6a3e3e18e9bd8a1598c6050839529311fc9ad8'
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
