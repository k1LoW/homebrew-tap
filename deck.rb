class Deck < Formula
  desc 'deck is a tool for creating deck using Google Slides.'
  version '0.19.0'
  homepage 'https://github.com/k1LoW/deck'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/deck/releases/download/v0.19.0/deck_v0.19.0_darwin_arm64.zip'
      sha256 '1e4faa3c6080c762fee27aa9641d5454811d74362e3450b786f83a4e30f5829d'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/deck/releases/download/v0.19.0/deck_v0.19.0_darwin_amd64.zip'
      sha256 'ea7f684fc1a4b51f2ae6f5ad3b3508585a0df2c3b958c3e966a20cbd1ded4a63'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/deck/releases/download/v0.19.0/deck_v0.19.0_linux_arm64.tar.gz'
      sha256 '41e77544101c388bf65462952749ad89cd8187dddcfa1d5ec05f9f3608a52077'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/deck/releases/download/v0.19.0/deck_v0.19.0_linux_amd64.tar.gz'
      sha256 '85b7fa3e03dd9fff00a47a9143d458e54060c2acc20fe28c74a7244d38e1270b'
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
