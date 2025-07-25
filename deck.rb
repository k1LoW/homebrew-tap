class Deck < Formula
  desc 'deck is a tool for creating deck using Google Slides.'
  version '1.4.0'
  homepage 'https://github.com/k1LoW/deck'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/deck/releases/download/v1.4.0/deck_v1.4.0_darwin_arm64.zip'
      sha256 'e5190bd5df37df2ddc08120da1b2e7c2dd4bc307a525ba29f48ef435ee3e4225'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/deck/releases/download/v1.4.0/deck_v1.4.0_darwin_amd64.zip'
      sha256 '5965fdea1e83d76e57837bf283f0e72c2b9b7575a7e54842d26fe1891c1fc0bc'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/deck/releases/download/v1.4.0/deck_v1.4.0_linux_arm64.tar.gz'
      sha256 'baa0ea4ed6556cd22da1e36bda18eda216a5e0d8440b1bd711f86bd50d3ef6f7'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/deck/releases/download/v1.4.0/deck_v1.4.0_linux_amd64.tar.gz'
      sha256 '9eaec9b52c392e3bbe55c8de5f54d564b1738ad0b9f777c6f74c911be2ed2885'
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
