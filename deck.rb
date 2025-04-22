class Deck < Formula
  desc 'deck is a tool for creating deck using Google Slides.'
  version '0.13.4'
  homepage 'https://github.com/k1LoW/deck'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/deck/releases/download/v0.13.4/deck_v0.13.4_darwin_arm64.zip'
      sha256 '25b1a203713243be5eab034ac76c9799319b7aabdf8fe0d36ce9b04a90b8ba34'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/deck/releases/download/v0.13.4/deck_v0.13.4_darwin_amd64.zip'
      sha256 'd505b6f9a427fe308234b5a5db72132b7f2fe3a0573805564068530e68df6191'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/deck/releases/download/v0.13.4/deck_v0.13.4_linux_arm64.tar.gz'
      sha256 '2b172a90155ea59d950c3ceb7d420f6871c7f87e3a486f83673ab7dfc8911643'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/deck/releases/download/v0.13.4/deck_v0.13.4_linux_amd64.tar.gz'
      sha256 '35967f1ce0153eecf83ba409cc0735d2e8f54db49e3a2c178ce937e218d045ed'
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
