class Deck < Formula
  desc 'deck is a tool for creating deck using Google Slides.'
  version '0.10.2'
  homepage 'https://github.com/k1LoW/deck'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/deck/releases/download/v0.10.2/deck_v0.10.2_darwin_arm64.zip'
      sha256 '90d72665bfc6a280b7711ef800578a08ec6fbd549f17969a227dbd1155f4a1d4'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/deck/releases/download/v0.10.2/deck_v0.10.2_darwin_amd64.zip'
      sha256 '182e768565b42a56d5902fa9ca04eeb4e1ed2963e27947a60b6e268dd6ed11fd'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/deck/releases/download/v0.10.2/deck_v0.10.2_linux_arm64.tar.gz'
      sha256 '1263a44cf3b320b600cde4403f05b112be15fb08a6b74371c0fdbf131819030f'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/deck/releases/download/v0.10.2/deck_v0.10.2_linux_amd64.tar.gz'
      sha256 '35a8ed44376841b5b7093becf369c4c72ad93b835b2966471d3110f02b6fa1f1'
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
