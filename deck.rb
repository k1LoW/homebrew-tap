class Deck < Formula
  desc 'deck is a tool for creating deck using Google Slides.'
  version '0.4.1'
  homepage 'https://github.com/k1LoW/deck'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/deck/releases/download/v0.4.1/deck_v0.4.1_darwin_arm64.zip'
      sha256 'b479ab784ca8b624192f227fc9b10e5a8bc9ec48d8321ef0a57254f8843ede42'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/deck/releases/download/v0.4.1/deck_v0.4.1_darwin_amd64.zip'
      sha256 'e1ea9086e113e3aee5f669b076bd158d6754774fb0e80e57be5c2c83223b8e07'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/deck/releases/download/v0.4.1/deck_v0.4.1_linux_arm64.tar.gz'
      sha256 '9c5f0be79e4ae78ac068139cb0a4de06af8ee9627d3a1c589ff651ed3831aa07'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/deck/releases/download/v0.4.1/deck_v0.4.1_linux_amd64.tar.gz'
      sha256 '9b28b1274b387dee864fcb31688e2826678ec967449f390e4c8a9b9fd44c7606'
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
