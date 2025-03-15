class Deck < Formula
  desc 'deck is a tool for creating deck using Google Slides.'
  version '0.6.1'
  homepage 'https://github.com/k1LoW/deck'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/deck/releases/download/v0.6.1/deck_v0.6.1_darwin_arm64.zip'
      sha256 '2bf5b936ef5aafffec73cb62a6bbb2789f5409df51d4e20d841d6d8d4b0fb716'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/deck/releases/download/v0.6.1/deck_v0.6.1_darwin_amd64.zip'
      sha256 '92799d71ae74a888e59438d1fdecd75fb6a0c4a9d187914fe7bc97ba095d459c'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/deck/releases/download/v0.6.1/deck_v0.6.1_linux_arm64.tar.gz'
      sha256 'b10bdcf345febe6111f4295ffee0db5fd7886d330001efa3b74753ef78195d92'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/deck/releases/download/v0.6.1/deck_v0.6.1_linux_amd64.tar.gz'
      sha256 '64c8c2def6abbc3424c70f176a347b0714d3f12866942d99b6ec100cbcb68d9d'
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
