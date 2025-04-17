class Deck < Formula
  desc 'deck is a tool for creating deck using Google Slides.'
  version '0.13.3'
  homepage 'https://github.com/k1LoW/deck'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/deck/releases/download/v0.13.3/deck_v0.13.3_darwin_arm64.zip'
      sha256 '97b24fda5e1fbe3a0437d12f85d20daa1252fe2aee0595c5831c547ecc9d5668'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/deck/releases/download/v0.13.3/deck_v0.13.3_darwin_amd64.zip'
      sha256 '9a2b6672d925fbf4c1f4ffb2c80b9296018d102e510cb1aea82b4c682ec2ea9b'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/deck/releases/download/v0.13.3/deck_v0.13.3_linux_arm64.tar.gz'
      sha256 '0aa269fe40cce9c77c6cfa506112c182cd18f345cb6f0cdfeaa9203b65ab3fce'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/deck/releases/download/v0.13.3/deck_v0.13.3_linux_amd64.tar.gz'
      sha256 '8d0e7504551ee54893cf946f9ddba03057e2a4f2fa9c6beef05bea827e132c09'
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
