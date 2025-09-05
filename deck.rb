class Deck < Formula
  desc 'deck is a tool for creating deck using Google Slides.'
  version '1.21.3'
  homepage 'https://github.com/k1LoW/deck'

  deprecate! date: "2025-08-02", because: "please use the official Homebrew formula instead"

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/deck/releases/download/v1.21.3/deck_v1.21.3_darwin_arm64.zip'
      sha256 '1fd446fc695b8e1e750242ef2436aed27b2617081c5575e7660ed9403beab6b8'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/deck/releases/download/v1.21.3/deck_v1.21.3_darwin_amd64.zip'
      sha256 'bf4adfbbedf51c06858e6602eaa34f65c2d5ac638118c5c12d56bac286164000'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/deck/releases/download/v1.21.3/deck_v1.21.3_linux_arm64.tar.gz'
      sha256 '78253324f836fa60549bbf0b3daedf6bf1e235268d4a7e7fe4188e15e5a0658a'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/deck/releases/download/v1.21.3/deck_v1.21.3_linux_amd64.tar.gz'
      sha256 '06cede31666902abd01aa26ad82073562639a021155487c322c6def847ca3e5a'
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
