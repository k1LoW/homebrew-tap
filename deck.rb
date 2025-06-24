class Deck < Formula
  desc 'deck is a tool for creating deck using Google Slides.'
  version '0.25.0'
  homepage 'https://github.com/k1LoW/deck'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/deck/releases/download/v0.25.0/deck_v0.25.0_darwin_arm64.zip'
      sha256 '27ec0bb8cd26b04b626e0b51bedeae73d9361938eb1ad941af54c90e0572e4a8'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/deck/releases/download/v0.25.0/deck_v0.25.0_darwin_amd64.zip'
      sha256 'cb5082aae8bac07342c0716e8c4d2017f1bad79b8bee9802c6b66284323bda8e'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/deck/releases/download/v0.25.0/deck_v0.25.0_linux_arm64.tar.gz'
      sha256 '3efe772c6d2b2c127f5ed821236e09796ce4857f479eb8639f0aa4080df3f389'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/deck/releases/download/v0.25.0/deck_v0.25.0_linux_amd64.tar.gz'
      sha256 '934bb7506e483de48b74395a6f67a97410b06b866a2a71008b90e6296c2cb621'
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
