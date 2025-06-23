class Deck < Formula
  desc 'deck is a tool for creating deck using Google Slides.'
  version '0.24.2'
  homepage 'https://github.com/k1LoW/deck'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/deck/releases/download/v0.24.2/deck_v0.24.2_darwin_arm64.zip'
      sha256 'dcd136ab9ee42128a22cafacf8e92a57447788f2b7473a1281311c5ce44f24e3'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/deck/releases/download/v0.24.2/deck_v0.24.2_darwin_amd64.zip'
      sha256 'aae614963e428e5ceaf99d30ffd68f73140884038baf29035552a3182c73ba16'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/deck/releases/download/v0.24.2/deck_v0.24.2_linux_arm64.tar.gz'
      sha256 '5ae95a749dd249401f1ff3a2472cd37e43353aba669acd7f0065a4aea0ca989b'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/deck/releases/download/v0.24.2/deck_v0.24.2_linux_amd64.tar.gz'
      sha256 'a6bae8d8776d2c86d1fb0a5617555b2e7605f1b4a2747713bb57da232050bf59'
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
