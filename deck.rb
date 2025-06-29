class Deck < Formula
  desc 'deck is a tool for creating deck using Google Slides.'
  version '0.28.0'
  homepage 'https://github.com/k1LoW/deck'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/deck/releases/download/v0.28.0/deck_v0.28.0_darwin_arm64.zip'
      sha256 '14c479d6334a09dd1cb251b17f662774be4947e5ab344661ace08121601a3278'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/deck/releases/download/v0.28.0/deck_v0.28.0_darwin_amd64.zip'
      sha256 '5616c8ad876025c86923472a64c64f4a4ce31b1a95760dd645c5c632d24289eb'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/deck/releases/download/v0.28.0/deck_v0.28.0_linux_arm64.tar.gz'
      sha256 '2044e7cde94ad982e804ea76c1f96b078c2a34bc38fd057eb5192f0197ade971'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/deck/releases/download/v0.28.0/deck_v0.28.0_linux_amd64.tar.gz'
      sha256 '46548d58d713674628e13d73ceb67e6715d264539ff6b0361d68297bd30b3f6c'
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
