class Deck < Formula
  desc 'deck is a tool for creating deck using Google Slides.'
  version '0.11.0'
  homepage 'https://github.com/k1LoW/deck'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/deck/releases/download/v0.11.0/deck_v0.11.0_darwin_arm64.zip'
      sha256 'f396bc32fc81a451abda793a338c49479f8cc42e192b871f589c857e42062b51'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/deck/releases/download/v0.11.0/deck_v0.11.0_darwin_amd64.zip'
      sha256 '83bed24f37fccb6b1f4b17864421eb7608d40804aa5a17412a444a3b7bfc7d7f'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/deck/releases/download/v0.11.0/deck_v0.11.0_linux_arm64.tar.gz'
      sha256 'c48fe683b6409a6d291a67a53805f3bf50962ca070161ec65ba3ccefb1f1f1db'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/deck/releases/download/v0.11.0/deck_v0.11.0_linux_amd64.tar.gz'
      sha256 'd4b71b86465a290ff79bac1e9fcc7a7e1a48ecb338d4b807f7e99711aa5f2e8f'
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
