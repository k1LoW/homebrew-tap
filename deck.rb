class Deck < Formula
  desc 'deck is a tool for creating deck using Google Slides.'
  version '0.37.1'
  homepage 'https://github.com/k1LoW/deck'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/deck/releases/download/v0.37.1/deck_v0.37.1_darwin_arm64.zip'
      sha256 '4545ae6701529d84ba8b0d2c44feca719b9d26a1bc3a32a81bd426927cb44527'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/deck/releases/download/v0.37.1/deck_v0.37.1_darwin_amd64.zip'
      sha256 '126f37894bd70a6768fb7976169c25768a545d48b661f97c61ec126f3250d20d'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/deck/releases/download/v0.37.1/deck_v0.37.1_linux_arm64.tar.gz'
      sha256 'e21571b7182754402025978141477a280db42ae712070704925dd1342cd4708f'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/deck/releases/download/v0.37.1/deck_v0.37.1_linux_amd64.tar.gz'
      sha256 '19c6e2cae263383636f22e1769531552c51aee5378326a1bc3df21dcc3d86729'
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
