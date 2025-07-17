class Deck < Formula
  desc 'deck is a tool for creating deck using Google Slides.'
  version '0.42.2'
  homepage 'https://github.com/k1LoW/deck'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/deck/releases/download/v0.42.2/deck_v0.42.2_darwin_arm64.zip'
      sha256 '8a3e3b290354526e0ec476c438a6c173ca899b88d812b2ea4abd105cc8971f73'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/deck/releases/download/v0.42.2/deck_v0.42.2_darwin_amd64.zip'
      sha256 '0ef58a1f83714d7f78cba6b8813bd55dcb60220a9b0bc14e88feb99e44b3699c'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/deck/releases/download/v0.42.2/deck_v0.42.2_linux_arm64.tar.gz'
      sha256 '8ceaf48844a27c8ea14806e6fbb3d70b13ff4247576274c1770eb67d927931fc'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/deck/releases/download/v0.42.2/deck_v0.42.2_linux_amd64.tar.gz'
      sha256 '85fddb4e1d3cd5dd52dc8ead993e3852d26024ae8a5415b09de5828bfc0f3871'
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
