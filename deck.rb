class Deck < Formula
  desc 'deck is a tool for creating deck using Google Slides.'
  version '0.21.0'
  homepage 'https://github.com/k1LoW/deck'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/deck/releases/download/v0.21.0/deck_v0.21.0_darwin_arm64.zip'
      sha256 '971370fbcbdf5652cd80e9a8c58986389aa636919df7f46b415435d0ad07ab7e'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/deck/releases/download/v0.21.0/deck_v0.21.0_darwin_amd64.zip'
      sha256 '8f138b3808a54b120e130e8a8419ae86d8be25a9fab049d2d2ace6740e80845f'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/deck/releases/download/v0.21.0/deck_v0.21.0_linux_arm64.tar.gz'
      sha256 '284a2fe7e7a15cccdfad014eab5020d97d6a1b2bb297a9dcd06ddafa03406e16'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/deck/releases/download/v0.21.0/deck_v0.21.0_linux_amd64.tar.gz'
      sha256 'a11138574a0e63c17b4f4a21aa9184321f4b3e0cd581d365bce377bf93caf0b2'
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
