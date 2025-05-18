class Deck < Formula
  desc 'deck is a tool for creating deck using Google Slides.'
  version '0.17.1'
  homepage 'https://github.com/k1LoW/deck'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/deck/releases/download/v0.17.1/deck_v0.17.1_darwin_arm64.zip'
      sha256 'a3d9d96b6e1e41014604b2020d0ebe35a9b8821972ee00b0498edcb9678c3871'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/deck/releases/download/v0.17.1/deck_v0.17.1_darwin_amd64.zip'
      sha256 'a0a7017977d9cf7c3bdc9566b6ca6759728a027113ca15d63db2fcf44dad9ed4'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/deck/releases/download/v0.17.1/deck_v0.17.1_linux_arm64.tar.gz'
      sha256 '145ca2dd7beb552de64b187be91792c0029563c082fbe1a21aaa7b95d0531ac7'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/deck/releases/download/v0.17.1/deck_v0.17.1_linux_amd64.tar.gz'
      sha256 'df5e0809894c0feb00d160e59f582495223fd02be62af405db636338489a2eb8'
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
