class Deck < Formula
  desc 'deck is a tool for creating deck using Google Slides.'
  version '1.7.0'
  homepage 'https://github.com/k1LoW/deck'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/deck/releases/download/v1.7.0/deck_v1.7.0_darwin_arm64.zip'
      sha256 '4299576debbaf36789de5d46ad3311e1a19f0634f70a8f853883aeedf7571b72'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/deck/releases/download/v1.7.0/deck_v1.7.0_darwin_amd64.zip'
      sha256 'c44d88f3fc6a1b45190e8a6b3262631d620faa34ece04a3f010f7f8e27cbc082'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/deck/releases/download/v1.7.0/deck_v1.7.0_linux_arm64.tar.gz'
      sha256 '6681526edee2edfda779b9199cee638b07607b12478becfd2971ee3b2867a90e'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/deck/releases/download/v1.7.0/deck_v1.7.0_linux_amd64.tar.gz'
      sha256 'ead0d92355f8bc103b12487909bc852e7b7ccd831c565e72620cb3b9f39dd2fd'
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
