class Deck < Formula
  desc 'deck is a tool for creating deck using Google Slides.'
  version '0.13.5'
  homepage 'https://github.com/k1LoW/deck'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/deck/releases/download/v0.13.5/deck_v0.13.5_darwin_arm64.zip'
      sha256 'eaac10c9efd72d21d4605410698b313f8ec0e0aace960fc05fd5a243b5b0472c'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/deck/releases/download/v0.13.5/deck_v0.13.5_darwin_amd64.zip'
      sha256 '7a36060affcb8db6db9f1fea3647954e3ba08a7faa8b20c6bcb47d7305aaf4fc'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/deck/releases/download/v0.13.5/deck_v0.13.5_linux_arm64.tar.gz'
      sha256 'a3e69f63bd8efb3cfeff3b5fe53a1935335e903ab3f51ed0aeb01e667ec7af9f'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/deck/releases/download/v0.13.5/deck_v0.13.5_linux_amd64.tar.gz'
      sha256 'ac9190c40cec2637c7a206b68cda446fd8be34d817c7f0b16f709da011b15278'
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
