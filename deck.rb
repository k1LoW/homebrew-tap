class Deck < Formula
  desc 'deck is a tool for creating deck using Google Slides.'
  version '0.16.2'
  homepage 'https://github.com/k1LoW/deck'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/deck/releases/download/v0.16.2/deck_v0.16.2_darwin_arm64.zip'
      sha256 '55588cb213bd91d4155ea9479774a6e79d82a3999e29f40598f343b053ef5ef7'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/deck/releases/download/v0.16.2/deck_v0.16.2_darwin_amd64.zip'
      sha256 'ae87ff380b2e3d63a44b0507b01bcb88f7a4ed195fff0251a7559cd62e5f9743'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/deck/releases/download/v0.16.2/deck_v0.16.2_linux_arm64.tar.gz'
      sha256 'fa5209c4abfcd6c04f0165768522dfdbd2f44c3cc46b988a38506ac68162cc4c'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/deck/releases/download/v0.16.2/deck_v0.16.2_linux_amd64.tar.gz'
      sha256 '1d803ccc61754e4afe4d36c87619281363ac72e3d219ebb4ff2f5704c666bfc7'
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
