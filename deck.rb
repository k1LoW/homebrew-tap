class Deck < Formula
  desc 'deck is a tool for creating deck using Google Slides.'
  version '0.40.2'
  homepage 'https://github.com/k1LoW/deck'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/deck/releases/download/v0.40.2/deck_v0.40.2_darwin_arm64.zip'
      sha256 '519e825998f1635643ea52f160a08228aaf20d3c7a1b7105381b1dcfc746a82b'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/deck/releases/download/v0.40.2/deck_v0.40.2_darwin_amd64.zip'
      sha256 '2523fa0a0945541c94708efda7621f8c3ebfbb331c2307e807bbcfc88e0e2ccc'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/deck/releases/download/v0.40.2/deck_v0.40.2_linux_arm64.tar.gz'
      sha256 'c2c5e017f8563401e3dc6f89176042029c840f65dad35b24a57e8a832461e7cb'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/deck/releases/download/v0.40.2/deck_v0.40.2_linux_amd64.tar.gz'
      sha256 '2bcf6fce4bd0a857e1fea2f7c395c4312f17678a49c5ef48ce89f80343d06d01'
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
