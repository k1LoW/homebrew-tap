class Deck < Formula
  desc 'deck is a tool for creating deck using Google Slides.'
  version '0.17.0'
  homepage 'https://github.com/k1LoW/deck'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/deck/releases/download/v0.17.0/deck_v0.17.0_darwin_arm64.zip'
      sha256 '158e7af124c624df029c037358fc3d9a015dfa5ec6fa349772ae7705d4e2b2ec'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/deck/releases/download/v0.17.0/deck_v0.17.0_darwin_amd64.zip'
      sha256 'e8d92b3121a9424f6906e1d9c8164224ec6da2958695014e2b96e7a8680436f7'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/deck/releases/download/v0.17.0/deck_v0.17.0_linux_arm64.tar.gz'
      sha256 'ffb6cb0eacc595a649bab5655788c602d855c9acc8224c912c7004879a3e145a'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/deck/releases/download/v0.17.0/deck_v0.17.0_linux_amd64.tar.gz'
      sha256 '67e05b3d45a3e9f981b67315cdb384165a7add007e911be75d4ac620e06b4010'
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
