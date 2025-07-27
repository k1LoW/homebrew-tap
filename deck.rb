class Deck < Formula
  desc 'deck is a tool for creating deck using Google Slides.'
  version '1.6.0'
  homepage 'https://github.com/k1LoW/deck'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/deck/releases/download/v1.6.0/deck_v1.6.0_darwin_arm64.zip'
      sha256 '04031616cefd041e30310653943ea82b2aca1035bb35056ef5f22cf486bd4854'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/deck/releases/download/v1.6.0/deck_v1.6.0_darwin_amd64.zip'
      sha256 '07d128fe10859fc1ba763b4d41e832d06d16c6e457502d25ecd9d40a94c0652e'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/deck/releases/download/v1.6.0/deck_v1.6.0_linux_arm64.tar.gz'
      sha256 '7a2e70c4589c4a546e4325fea4a6169914eec5b7391f5440ff2899f64f5579f8'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/deck/releases/download/v1.6.0/deck_v1.6.0_linux_amd64.tar.gz'
      sha256 '224b5f6dc4a5b2372c5a2e6dd63c6074415bc4c2845ba56bb5b01190b486b95b'
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
