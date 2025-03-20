class Deck < Formula
  desc 'deck is a tool for creating deck using Google Slides.'
  version '0.11.1'
  homepage 'https://github.com/k1LoW/deck'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/deck/releases/download/v0.11.1/deck_v0.11.1_darwin_arm64.zip'
      sha256 '3b83782358e4e3f7bc2b971173d71a4e8e8e5d53ba195b30163a5df4a27fda49'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/deck/releases/download/v0.11.1/deck_v0.11.1_darwin_amd64.zip'
      sha256 '910aac0f15e665f6fe82ebc7be0dc2a7767dcd1f7fe319251fb2aa7ee60e021b'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/deck/releases/download/v0.11.1/deck_v0.11.1_linux_arm64.tar.gz'
      sha256 'cdda22b3a94792de10c34017ffbde0867b327ee7cacac006a711f1138eb0c00f'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/deck/releases/download/v0.11.1/deck_v0.11.1_linux_amd64.tar.gz'
      sha256 'e9274d9337bbdf793166a30b574347ab47c9f2c0a506421140c849c75d7e3455'
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
