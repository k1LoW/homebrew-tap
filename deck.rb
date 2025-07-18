class Deck < Formula
  desc 'deck is a tool for creating deck using Google Slides.'
  version '0.43.1'
  homepage 'https://github.com/k1LoW/deck'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/deck/releases/download/v0.43.1/deck_v0.43.1_darwin_arm64.zip'
      sha256 '020d488bf7f7550e969901f6ccb10fcce8427d41ac8ee35a6aaf7c70d4904324'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/deck/releases/download/v0.43.1/deck_v0.43.1_darwin_amd64.zip'
      sha256 '8aeeadb11ca92b2d8f1470d5a37b5fcdd6e701a3ee79305773841aafbba3adcd'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/deck/releases/download/v0.43.1/deck_v0.43.1_linux_arm64.tar.gz'
      sha256 '6bffa8ff6078758c95a452a7148092bace639a767b3606d43b7bb739fd893edc'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/deck/releases/download/v0.43.1/deck_v0.43.1_linux_amd64.tar.gz'
      sha256 '0adcfe7dcacfcabaf29a20edc3dd0092ff027d2416bf250557a574ebe282f7f2'
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
