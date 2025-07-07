class Deck < Formula
  desc 'deck is a tool for creating deck using Google Slides.'
  version '0.36.0'
  homepage 'https://github.com/k1LoW/deck'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/deck/releases/download/v0.36.0/deck_v0.36.0_darwin_arm64.zip'
      sha256 '68c219cc143ecee12f6283605eba5711e5a00100c7e20efdcb74ae3cf09a90da'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/deck/releases/download/v0.36.0/deck_v0.36.0_darwin_amd64.zip'
      sha256 '09406dab49732a3d11c759fad389db57f1a8b362f4297eb26c38f2b6eceab4d6'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/deck/releases/download/v0.36.0/deck_v0.36.0_linux_arm64.tar.gz'
      sha256 '611c2c72c7c4ec29ca0100be1a4da7a64791bf0b1f20ed8797bc4d303b0c74b8'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/deck/releases/download/v0.36.0/deck_v0.36.0_linux_amd64.tar.gz'
      sha256 '25f940831ee21edca064dd26674f23653e34256e621ff5df689115d081176071'
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
