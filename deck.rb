class Deck < Formula
  desc 'deck is a tool for creating deck using Google Slides.'
  version '0.0.1'
  homepage 'https://github.com/k1LoW/deck'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/deck/releases/download/v0.0.1/deck_v0.0.1_darwin_arm64.zip'
      sha256 '80d65b14ec3ed67855c1e9ac46d60b8ea70b712f6941e8037bbc37dc5e81e314'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/deck/releases/download/v0.0.1/deck_v0.0.1_darwin_amd64.zip'
      sha256 'c6780c7dde341d2bf5e7bbb3cd9507eb6dc2ac893968a96d68df8478cfff5305'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/deck/releases/download/v0.0.1/deck_v0.0.1_linux_arm64.tar.gz'
      sha256 '2308bbd4e29f18f601a2c2a5b54f99a6a4f2961c67fa5752eb0ad5ae7c797fe7'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/deck/releases/download/v0.0.1/deck_v0.0.1_linux_amd64.tar.gz'
      sha256 'dc638d9f5e068beb30d32603399b0721d686f32ec4661d373c7dcb937e8f7797'
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
