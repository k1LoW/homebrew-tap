class Deck < Formula
  desc 'deck is a tool for creating deck using Google Slides.'
  version '0.11.2'
  homepage 'https://github.com/k1LoW/deck'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/deck/releases/download/v0.11.2/deck_v0.11.2_darwin_arm64.zip'
      sha256 '235c78692b35a52c5fe0b3ac67c0b3f42149604fa308d0270647f67cf3567a69'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/deck/releases/download/v0.11.2/deck_v0.11.2_darwin_amd64.zip'
      sha256 'be238a8feb7f837980de51b693b3b977510f5db68dd3b0cf79722e5a58417014'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/deck/releases/download/v0.11.2/deck_v0.11.2_linux_arm64.tar.gz'
      sha256 'ba8207618900fbe7378fcd3846be1d5d559b3e3a7842c9687fff68844dc8d817'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/deck/releases/download/v0.11.2/deck_v0.11.2_linux_amd64.tar.gz'
      sha256 '3d18fc88e59d3ad4a2c9b92c6b16cc3c2a833a06e2016fff045605d4e8209296'
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
