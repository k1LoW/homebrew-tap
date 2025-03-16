class Deck < Formula
  desc 'deck is a tool for creating deck using Google Slides.'
  version '0.8.1'
  homepage 'https://github.com/k1LoW/deck'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/deck/releases/download/v0.8.1/deck_v0.8.1_darwin_arm64.zip'
      sha256 'd75a8754bc009bc863608ea5416fd7b0e60f41ea2d2df82a2c272c4bd925bbcc'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/deck/releases/download/v0.8.1/deck_v0.8.1_darwin_amd64.zip'
      sha256 'c151b40c5359cc703360cc837a4e72e28d341f79f84deecf37ed2f0816bcd796'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/deck/releases/download/v0.8.1/deck_v0.8.1_linux_arm64.tar.gz'
      sha256 'ce4f9088fe12f23a0333cd2e0ec625321c7a321ada5b040932d5d401799a9f3d'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/deck/releases/download/v0.8.1/deck_v0.8.1_linux_amd64.tar.gz'
      sha256 '3d1b62a71cd95344a8ffd6cd6b3be647a95f9cb9db43c6ea58dd7000ab259bd7'
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
