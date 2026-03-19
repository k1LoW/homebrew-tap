class Deck < Formula
  desc 'deck is a tool for creating deck using Google Slides.'
  version '1.23.1'
  homepage 'https://github.com/k1LoW/deck'

  deprecate! date: "2025-08-02", because: "please use the official Homebrew formula instead"

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/deck/releases/download/v1.23.1/deck_v1.23.1_darwin_arm64.zip'
      sha256 'fa8b7652bd57e911714f2eef80f62a151f962a8b6a369fa54c298e2ee2860571'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/deck/releases/download/v1.23.1/deck_v1.23.1_darwin_amd64.zip'
      sha256 '97bbecb6f7fc519c834f91dfe08adfe4cdd0b4a565ed97a083fce2c3820e153b'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/deck/releases/download/v1.23.1/deck_v1.23.1_linux_arm64.tar.gz'
      sha256 '87e31d153578875ee61c3070eb5dc21b232bd2e04575f24dce37ecedb7e613f0'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/deck/releases/download/v1.23.1/deck_v1.23.1_linux_amd64.tar.gz'
      sha256 'ddfc3a2b3c8d65e2ef5b372adf9f281ef0eb4fba2bdcd473e878467c62797f9a'
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
