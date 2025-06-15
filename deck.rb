class Deck < Formula
  desc 'deck is a tool for creating deck using Google Slides.'
  version '0.21.1'
  homepage 'https://github.com/k1LoW/deck'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/deck/releases/download/v0.21.1/deck_v0.21.1_darwin_arm64.zip'
      sha256 '1c967fff50abd78ed55e6d33af2249196b2ba42660ef4a897dbcfee9b238ba88'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/deck/releases/download/v0.21.1/deck_v0.21.1_darwin_amd64.zip'
      sha256 '2fdd9ad8e40277068ab678da9cd3888d8efb4c0d5c13470b550b7b187b6c3819'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/deck/releases/download/v0.21.1/deck_v0.21.1_linux_arm64.tar.gz'
      sha256 '9797ff283eee6805743dd4192f6a9feed1c80131ad7d001040e85d03cfdbf9e3'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/deck/releases/download/v0.21.1/deck_v0.21.1_linux_amd64.tar.gz'
      sha256 '55a7aa0b2a85890179254f46ce5e609aef41aad2abb1df9bb457a8d7d0924196'
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
