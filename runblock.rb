class Runblock < Formula
  desc '`runblock` is a tool for executing code blocks in Markdown files using external commands.'
  version '0.1.0'
  homepage 'https://github.com/k1LoW/runblock'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/runblock/releases/download/v0.1.0/runblock_v0.1.0_darwin_arm64.zip'
      sha256 '1b4f4e6ae2da01dda62cbec0be0809d1b88d7b5d0fb5b9ba22515980245689da'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runblock/releases/download/v0.1.0/runblock_v0.1.0_darwin_amd64.zip'
      sha256 '46cd6f07943088695a9dded7f72517952a35ab65b81c3cd3a1e72d440cdf00c8'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/runblock/releases/download/v0.1.0/runblock_v0.1.0_linux_arm64.tar.gz'
      sha256 '0112044769c9ae657dbcc0b10d1761a22591f69dc5ade6be31bdeea8b23f2cbe'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runblock/releases/download/v0.1.0/runblock_v0.1.0_linux_amd64.tar.gz'
      sha256 '3dff331b65e70da2a9bb0f3301f8fbf019cdbed8ad30e7268eaaecfeff3e0151'
    end
  end

  head do
    url 'https://github.com/k1LoW/runblock.git'
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    bin.install 'runblock'
  end
end
