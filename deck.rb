class Deck < Formula
  desc 'deck is a tool for creating deck using Google Slides.'
  version '0.29.1'
  homepage 'https://github.com/k1LoW/deck'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/deck/releases/download/v0.29.1/deck_v0.29.1_darwin_arm64.zip'
      sha256 'e5c0d580a7ad1bf759cb3e1ddd82564689853cf2eb2c09984686fb3bb9b2a6ea'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/deck/releases/download/v0.29.1/deck_v0.29.1_darwin_amd64.zip'
      sha256 '434cc2dc46673907396fb10b1048e5acb8054a72fc075eff9ec56782da779128'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/deck/releases/download/v0.29.1/deck_v0.29.1_linux_arm64.tar.gz'
      sha256 '04e46396167b7ce3233035a58ddf1747925a0aec84f8b6f04862b71a0507bd14'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/deck/releases/download/v0.29.1/deck_v0.29.1_linux_amd64.tar.gz'
      sha256 '2fec747d5099d5d2b3a4fa902b1fbffdddea2d855861fb3f43281d8e81c28ea7'
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
