class Deck < Formula
  desc 'deck is a tool for creating deck using Google Slides.'
  version '0.35.0'
  homepage 'https://github.com/k1LoW/deck'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/deck/releases/download/v0.35.0/deck_v0.35.0_darwin_arm64.zip'
      sha256 '33eddf96c58ff6d9691b868000334b7977a8802d952a20884d8d5b1d5d3bb1ea'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/deck/releases/download/v0.35.0/deck_v0.35.0_darwin_amd64.zip'
      sha256 '0fe924ffb490209217d28f4aa20bfc35f8d2c964fde7c07dae8d084a7ecfc5b7'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/deck/releases/download/v0.35.0/deck_v0.35.0_linux_arm64.tar.gz'
      sha256 '5cece6f37372618fb516b50cf375804313a6ace479badb2860ebeda8c8b20a12'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/deck/releases/download/v0.35.0/deck_v0.35.0_linux_amd64.tar.gz'
      sha256 'b92dad31864c33f4521124de42d5356357899fff55710b5a80e590e34a54ac88'
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
