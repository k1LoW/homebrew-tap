class Deck < Formula
  desc 'deck is a tool for creating deck using Google Slides.'
  version '0.24.1'
  homepage 'https://github.com/k1LoW/deck'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/deck/releases/download/v0.24.1/deck_v0.24.1_darwin_arm64.zip'
      sha256 '77262b65fa04756022c1b188c6912e6d29d2cd555aca6672d1daecf05b0e57b4'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/deck/releases/download/v0.24.1/deck_v0.24.1_darwin_amd64.zip'
      sha256 '6c5d82345d9df7a4de26347f79d5538465c02d4c972a04f0609f9995276207b9'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/deck/releases/download/v0.24.1/deck_v0.24.1_linux_arm64.tar.gz'
      sha256 '7747743e9e0571ea3746cfc28da330c18b72c708b21de165fe4bebd1e96e5418'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/deck/releases/download/v0.24.1/deck_v0.24.1_linux_amd64.tar.gz'
      sha256 'a1eee07385fb8ea9ba68c9b47a29223fc48b430146ad3fdabdd5cfde845cc589'
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
