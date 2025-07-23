class Deck < Formula
  desc 'deck is a tool for creating deck using Google Slides.'
  version '1.3.0'
  homepage 'https://github.com/k1LoW/deck'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/deck/releases/download/v1.3.0/deck_v1.3.0_darwin_arm64.zip'
      sha256 '26ceb648d7b79d6c752beceeed66d375d13ab3813a9aba652c2425422d69c50b'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/deck/releases/download/v1.3.0/deck_v1.3.0_darwin_amd64.zip'
      sha256 '70a309f93077af63afd29bd84b9679dc98df51c1d2c83ab015b2c18dc963790c'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/deck/releases/download/v1.3.0/deck_v1.3.0_linux_arm64.tar.gz'
      sha256 '8dfe14797d156ff0f486b667409159c58d4640548443a8977da61d6279e23e43'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/deck/releases/download/v1.3.0/deck_v1.3.0_linux_amd64.tar.gz'
      sha256 '2ac0ddbf6b17c5cc836310543743c72921a9a9ca06f6e52de657c23b5f609803'
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
