class Deck < Formula
  desc 'deck is a tool for creating deck using Google Slides.'
  version '0.34.0'
  homepage 'https://github.com/k1LoW/deck'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/deck/releases/download/v0.34.0/deck_v0.34.0_darwin_arm64.zip'
      sha256 'f786db377134683614f55df1e81bf131d12e3515300a1bb7041d4acae3daa097'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/deck/releases/download/v0.34.0/deck_v0.34.0_darwin_amd64.zip'
      sha256 '8ed2efc1cc7954fe942297fedf9d7c4b7c807cb526644a7406c94200f230c488'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/deck/releases/download/v0.34.0/deck_v0.34.0_linux_arm64.tar.gz'
      sha256 '00db8214dced0d22d5466f0012d1afe5ed547a1a9a0c909b852384127c184ac8'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/deck/releases/download/v0.34.0/deck_v0.34.0_linux_amd64.tar.gz'
      sha256 '75bd2bd09fada35ff64ac57f0b459059b61f5a9a44de8bf5f2795e3203f87753'
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
