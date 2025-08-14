class Deck < Formula
  desc 'deck is a tool for creating deck using Google Slides.'
  version '1.13.1'
  homepage 'https://github.com/k1LoW/deck'

  deprecate! date: "2025-08-02", because: "please use the official Homebrew formula instead"

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/deck/releases/download/v1.13.1/deck_v1.13.1_darwin_arm64.zip'
      sha256 'c1870bbb31be04c6656ae366155566b1cbaaffdcde39203d047df99921bf86b3'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/deck/releases/download/v1.13.1/deck_v1.13.1_darwin_amd64.zip'
      sha256 'b4b2927086bf06cc7c7c4927781c507def5e735609153fcf38eb4175aee24e4b'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/deck/releases/download/v1.13.1/deck_v1.13.1_linux_arm64.tar.gz'
      sha256 '52406e37e4268c845d112aee1d8f8f29960acf6618b4560388269c2825c7c577'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/deck/releases/download/v1.13.1/deck_v1.13.1_linux_amd64.tar.gz'
      sha256 'e942de01b83444fee3ead3d08226ab5cdfab5adde1517f346851b14234ecaad9'
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
