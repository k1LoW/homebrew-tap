class Deck < Formula
  desc 'deck is a tool for creating deck using Google Slides.'
  version '0.44.0'
  homepage 'https://github.com/k1LoW/deck'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/deck/releases/download/v0.44.0/deck_v0.44.0_darwin_arm64.zip'
      sha256 '6c0cdd8a0f9d3d1b17cda381d0a9cdb19a3bbaea7b403729e59370743932375b'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/deck/releases/download/v0.44.0/deck_v0.44.0_darwin_amd64.zip'
      sha256 '32bdc766d7176d1be575ca1e47e836a4b317f5d94c065e6ea50ee86914cd863b'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/deck/releases/download/v0.44.0/deck_v0.44.0_linux_arm64.tar.gz'
      sha256 'dc08212b417df15c6ac43962e01958e289ae99e74471765435bf9fdd7750adfd'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/deck/releases/download/v0.44.0/deck_v0.44.0_linux_amd64.tar.gz'
      sha256 '012d850e14cd1760f18d690ae35bbbe06d484234515fd3ab9feb0b93a282cb5b'
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
