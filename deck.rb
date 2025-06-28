class Deck < Formula
  desc 'deck is a tool for creating deck using Google Slides.'
  version '0.27.0'
  homepage 'https://github.com/k1LoW/deck'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/deck/releases/download/v0.27.0/deck_v0.27.0_darwin_arm64.zip'
      sha256 '647bc3d3fc380546a6c20da2e9c5b28849d2a955e1595ee422ecb42d60b902a1'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/deck/releases/download/v0.27.0/deck_v0.27.0_darwin_amd64.zip'
      sha256 '0b1151107bf0ad9784526c256780aaf97d300a693443e4533cf6883eae549b16'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/deck/releases/download/v0.27.0/deck_v0.27.0_linux_arm64.tar.gz'
      sha256 'ab6855744a24b467901bef07d7dae8e7ee948838e609b26f1a3d88579df2766c'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/deck/releases/download/v0.27.0/deck_v0.27.0_linux_amd64.tar.gz'
      sha256 '486a5f456078d9557adff7aa52fe6b6f5145086e676fdaab695395d3d156bb8b'
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
