class Deck < Formula
  desc 'deck is a tool for creating deck using Google Slides.'
  version '0.12.0'
  homepage 'https://github.com/k1LoW/deck'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/deck/releases/download/v0.12.0/deck_v0.12.0_darwin_arm64.zip'
      sha256 '68e097e398960421c3511c3ee7a3b6a12ff2b6ccdf70d92558c18fce1180e3e6'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/deck/releases/download/v0.12.0/deck_v0.12.0_darwin_amd64.zip'
      sha256 'a5e1d4a22bd0e344a2036fcec435def88e39f707a91799cb1314d7d6cb48b52b'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/deck/releases/download/v0.12.0/deck_v0.12.0_linux_arm64.tar.gz'
      sha256 'b2215f616cd89972806cdfac5036fc9e76586ff2e1865875873169ecf711c8d9'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/deck/releases/download/v0.12.0/deck_v0.12.0_linux_amd64.tar.gz'
      sha256 'db2c8cdffa0171d1345ac934a51eff4460b8648096f964fff3ef28305097bf9c'
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
