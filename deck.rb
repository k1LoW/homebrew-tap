class Deck < Formula
  desc 'deck is a tool for creating deck using Google Slides.'
  version '0.3.0'
  homepage 'https://github.com/k1LoW/deck'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/deck/releases/download/v0.3.0/deck_v0.3.0_darwin_arm64.zip'
      sha256 '3b667fa622b4ff12933c457081c14b0e02097ef22addd4077102d5788558c1e4'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/deck/releases/download/v0.3.0/deck_v0.3.0_darwin_amd64.zip'
      sha256 '44fda0c7c0962a9211f53dcbb2e170348e79f0d04f871db69ee2a5efe6e62279'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/deck/releases/download/v0.3.0/deck_v0.3.0_linux_arm64.tar.gz'
      sha256 'e5526af24baa03af47211ee561e0c8ba733db6ae465b7fb5056bb17cd4b05755'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/deck/releases/download/v0.3.0/deck_v0.3.0_linux_amd64.tar.gz'
      sha256 '5ff0ad59c5f7d97c8b51e3b4ba16fa27659af4bfb302d57d4ed46daa6e52aabb'
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
