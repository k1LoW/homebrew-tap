class Deck < Formula
  desc 'deck is a tool for creating deck using Google Slides.'
  version '0.40.0'
  homepage 'https://github.com/k1LoW/deck'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/deck/releases/download/v0.40.0/deck_v0.40.0_darwin_arm64.zip'
      sha256 '7ba1a7b58a96c78b4c6b6eaa5622b74b032421137fcb4dfaf370f0eca39e7041'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/deck/releases/download/v0.40.0/deck_v0.40.0_darwin_amd64.zip'
      sha256 'a5513f26abdc905bfb87c6a5175d0acf8f23858b97e066a6ceed36a7a71876c0'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/deck/releases/download/v0.40.0/deck_v0.40.0_linux_arm64.tar.gz'
      sha256 'c3745fe87bbc1e155585a4dee4cb1505efc436cb674a158a2f41efced3a13733'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/deck/releases/download/v0.40.0/deck_v0.40.0_linux_amd64.tar.gz'
      sha256 'b947fa364a3c14f3f811494c085a57ea9bf37ba9ddcba593a36cb98bed55518e'
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
