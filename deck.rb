class Deck < Formula
  desc 'deck is a tool for creating deck using Google Slides.'
  version '0.32.0'
  homepage 'https://github.com/k1LoW/deck'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/deck/releases/download/v0.32.0/deck_v0.32.0_darwin_arm64.zip'
      sha256 'aca9ab8f93d26a830450a14aeb01d12e7c111074fc5cf5d22c400cf18ca811d4'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/deck/releases/download/v0.32.0/deck_v0.32.0_darwin_amd64.zip'
      sha256 '17984b41e4002b29a4117228a3c76513d780e35cefbb3bfc90277c0e1440b98c'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/deck/releases/download/v0.32.0/deck_v0.32.0_linux_arm64.tar.gz'
      sha256 '3433e2d552c9fbe035949532599bba61ea4ad1a926d6d920e3e358716c183c95'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/deck/releases/download/v0.32.0/deck_v0.32.0_linux_amd64.tar.gz'
      sha256 '3f5ce920d7242de178d96d9dc11ea871301459d8c16c1fd66479dcf8d3579e4b'
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
