class Deck < Formula
  desc 'deck is a tool for creating deck using Google Slides.'
  version '1.5.0'
  homepage 'https://github.com/k1LoW/deck'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/deck/releases/download/v1.5.0/deck_v1.5.0_darwin_arm64.zip'
      sha256 '4d36664cd4a3fb373bd4a8229cd8f056660f8e72709b98b3450d8e89a090c58c'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/deck/releases/download/v1.5.0/deck_v1.5.0_darwin_amd64.zip'
      sha256 'fac45312782614ad1938151b22d95251c4a31e0dfbec87f6b63e05290b8ec841'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/deck/releases/download/v1.5.0/deck_v1.5.0_linux_arm64.tar.gz'
      sha256 'e2572f208cee05600c3e7b433c6a0c757a62f18cb6d55b9f38f87b9faf84ed43'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/deck/releases/download/v1.5.0/deck_v1.5.0_linux_amd64.tar.gz'
      sha256 '74099ca9db45364e5f209d8f99a22513b388528bc07d12752dd4f39ce5fc8d9a'
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
