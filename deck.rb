class Deck < Formula
  desc 'deck is a tool for creating deck using Google Slides.'
  version '0.10.0'
  homepage 'https://github.com/k1LoW/deck'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/deck/releases/download/v0.10.0/deck_v0.10.0_darwin_arm64.zip'
      sha256 '31537ef2dbaf88b8b9c269332248363fd5677be977041c506ccdf7aa6f8073a0'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/deck/releases/download/v0.10.0/deck_v0.10.0_darwin_amd64.zip'
      sha256 '51fd80dbc2ee13a7be584a47eead8d586a2a7e0a3348ef2b7d7440dc21f28717'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/deck/releases/download/v0.10.0/deck_v0.10.0_linux_arm64.tar.gz'
      sha256 'a5c91d3fc7d3d5f72fd39d82750d5ae8deeca2d130c55d385ff448bce143cf47'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/deck/releases/download/v0.10.0/deck_v0.10.0_linux_amd64.tar.gz'
      sha256 '4019a34c3348fbdecbafc08afa717d8187f016ba0fc8af791d93aead8c8f98fc'
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
