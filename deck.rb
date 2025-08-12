class Deck < Formula
  desc 'deck is a tool for creating deck using Google Slides.'
  version '1.12.1'
  homepage 'https://github.com/k1LoW/deck'

  deprecate! date: "2025-08-02", because: "please use the official Homebrew formula instead"

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/deck/releases/download/v1.12.1/deck_v1.12.1_darwin_arm64.zip'
      sha256 'b6188d074b770c8ccaa7b611f23734bd30c368522644704867f74e83a49c2acb'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/deck/releases/download/v1.12.1/deck_v1.12.1_darwin_amd64.zip'
      sha256 '5ee52ff7805f1d39002092bc70e6910ecfc2ff39b8c6a32c133be25e144081c3'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/deck/releases/download/v1.12.1/deck_v1.12.1_linux_arm64.tar.gz'
      sha256 'e2814e1fee5146ab794b757de49ad70823ebf13fe78f41547c3dba3d4d355d90'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/deck/releases/download/v1.12.1/deck_v1.12.1_linux_amd64.tar.gz'
      sha256 '1da5ee9ba174a545ba2ff1909c0a5e6a1d0914ecf8fc443bb87cb17801f8c596'
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
