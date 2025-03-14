class Deck < Formula
  desc 'deck is a tool for creating deck using Google Slides.'
  version '0.1.1'
  homepage 'https://github.com/k1LoW/deck'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/deck/releases/download/v0.1.1/deck_v0.1.1_darwin_arm64.zip'
      sha256 '5a7e62f4561de731206618340ad377ad0326e31af365a48556a525a700c59d6e'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/deck/releases/download/v0.1.1/deck_v0.1.1_darwin_amd64.zip'
      sha256 '596c943c7db65384ddf08bfeb0c3ff8236acff0d3057138890c613c848bbb575'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/deck/releases/download/v0.1.1/deck_v0.1.1_linux_arm64.tar.gz'
      sha256 '0439701f9d0375210d7a96b01d7a4d54b148e02624acf75075d3cc3035e41766'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/deck/releases/download/v0.1.1/deck_v0.1.1_linux_amd64.tar.gz'
      sha256 '3947fff0501ec82ea39ca1c3423d6cc2c8864bbb6d5aff693b8963349bab7b47'
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
