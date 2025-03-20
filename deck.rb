class Deck < Formula
  desc 'deck is a tool for creating deck using Google Slides.'
  version '0.10.4'
  homepage 'https://github.com/k1LoW/deck'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/deck/releases/download/v0.10.4/deck_v0.10.4_darwin_arm64.zip'
      sha256 'fbc6a3bfd23d0a72a573e829b1b280f463556b004cddf54ad30a3113f2b73cc2'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/deck/releases/download/v0.10.4/deck_v0.10.4_darwin_amd64.zip'
      sha256 'c2a186ad97bfad4c7c6b2b082d919d62debe2e6ca87b09937913c5957b87f7e7'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/deck/releases/download/v0.10.4/deck_v0.10.4_linux_arm64.tar.gz'
      sha256 '51dab83cb2f2837007957c8b3570f83414cb9ff59a89438ac2ad5a0b0281b143'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/deck/releases/download/v0.10.4/deck_v0.10.4_linux_amd64.tar.gz'
      sha256 '14632da6c8a193dbd0aca2b445a747e4a994bc8fe9e03795f0ad401f9f8501c3'
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
