class Deck < Formula
  desc 'deck is a tool for creating deck using Google Slides.'
  version '0.19.1'
  homepage 'https://github.com/k1LoW/deck'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/deck/releases/download/v0.19.1/deck_v0.19.1_darwin_arm64.zip'
      sha256 'f3cadfa2c9335fe1f6545b20414cb271bf59a95736478347b1796640917e26c5'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/deck/releases/download/v0.19.1/deck_v0.19.1_darwin_amd64.zip'
      sha256 'a191adcf245e9188f989a176a9bba126efbb3f59b6781b7a13503a7b70500de5'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/deck/releases/download/v0.19.1/deck_v0.19.1_linux_arm64.tar.gz'
      sha256 '8b3fa28f9885277b1593627544a2f020baafd60f76babbacd977a18aee76f6a0'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/deck/releases/download/v0.19.1/deck_v0.19.1_linux_amd64.tar.gz'
      sha256 '77779c78f0adfae79db2719f5197d9c3a14d59149e29696d0364dbf3d091cb6e'
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
