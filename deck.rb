class Deck < Formula
  desc 'deck is a tool for creating deck using Google Slides.'
  version '0.31.0'
  homepage 'https://github.com/k1LoW/deck'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/deck/releases/download/v0.31.0/deck_v0.31.0_darwin_arm64.zip'
      sha256 '76b2a3169fb14a7d4c68e470b7ab4caee3396cd6ff403ddc9e0dff1e5a8b9361'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/deck/releases/download/v0.31.0/deck_v0.31.0_darwin_amd64.zip'
      sha256 'da59535203186f06a9e922c10e6ff2ccc314309dd2e624f305f882db02fe6b69'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/deck/releases/download/v0.31.0/deck_v0.31.0_linux_arm64.tar.gz'
      sha256 '5b31c6f2f488b91ceff9de239e4c4a113e6bdcfc5280ef67833388b47e7ed276'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/deck/releases/download/v0.31.0/deck_v0.31.0_linux_amd64.tar.gz'
      sha256 '5b9f6e465a50bc6945b12136cae2aaa19e3fbc3ccd07139a5848a707886d7714'
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
