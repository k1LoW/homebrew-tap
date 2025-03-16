class Deck < Formula
  desc 'deck is a tool for creating deck using Google Slides.'
  version '0.7.1'
  homepage 'https://github.com/k1LoW/deck'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/deck/releases/download/v0.7.1/deck_v0.7.1_darwin_arm64.zip'
      sha256 'e8f0e55c4dfce7b485dac7a34398159de9dfdd4163ff7f249c89fc9ff1ba5d3f'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/deck/releases/download/v0.7.1/deck_v0.7.1_darwin_amd64.zip'
      sha256 '25241b800c3fe46c9b76ae53e1961bae6df3815b36aef39ffba2fa6a5486b9ac'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/deck/releases/download/v0.7.1/deck_v0.7.1_linux_arm64.tar.gz'
      sha256 '5533b70a45d048d5344f9e3d80623847c2942046adc8102cace6026e08068ef2'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/deck/releases/download/v0.7.1/deck_v0.7.1_linux_amd64.tar.gz'
      sha256 '59cb569376af6ecceb38f6cb364386e2da2152e303129f70d4e9a879d7289ded'
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
