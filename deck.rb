class Deck < Formula
  desc 'deck is a tool for creating deck using Google Slides.'
  version '0.16.3'
  homepage 'https://github.com/k1LoW/deck'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/deck/releases/download/v0.16.3/deck_v0.16.3_darwin_arm64.zip'
      sha256 '88760926e41f5ed27362b669f15e419651d99498a9183b54a45f5dff34ea77a5'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/deck/releases/download/v0.16.3/deck_v0.16.3_darwin_amd64.zip'
      sha256 '72272eec47100853d812fe60ca92c7ee7904824fd37956ed06ab9626dfe34b2c'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/deck/releases/download/v0.16.3/deck_v0.16.3_linux_arm64.tar.gz'
      sha256 '0cba7abe8e862fd8e37d2d77f838f398e94b12289c3920aa4855b740ce6ef8aa'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/deck/releases/download/v0.16.3/deck_v0.16.3_linux_amd64.tar.gz'
      sha256 'fc5989ad4c55f88d21d315e54fa8a0ce9f2153dc6d99b429c7103eb49b459b2a'
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
