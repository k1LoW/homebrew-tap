class Deck < Formula
  desc 'deck is a tool for creating deck using Google Slides.'
  version '1.17.1'
  homepage 'https://github.com/k1LoW/deck'

  deprecate! date: "2025-08-02", because: "please use the official Homebrew formula instead"

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/deck/releases/download/v1.17.1/deck_v1.17.1_darwin_arm64.zip'
      sha256 'ff9c55789d7279e78699d4edaf592508da25053ca1d52f71c5c7e9ed1c12ecf4'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/deck/releases/download/v1.17.1/deck_v1.17.1_darwin_amd64.zip'
      sha256 'dea913fc8e1f78977a11ae85d992916f922667949531c6b48590b00297b58dc3'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/deck/releases/download/v1.17.1/deck_v1.17.1_linux_arm64.tar.gz'
      sha256 '8f45110aede7c42f5abcc956e96f92b0d7b7ad95a6b1ecf287e21bfea24ecbf4'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/deck/releases/download/v1.17.1/deck_v1.17.1_linux_amd64.tar.gz'
      sha256 '692b43db5438a17a23bc701a6ed811da8ca06ec3e4358129cf569a7bf9030eac'
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
