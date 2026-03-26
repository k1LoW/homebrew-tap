class Gostyle < Formula
  version '0.26.0'
  homepage 'https://github.com/k1LoW/gostyle'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/gostyle/releases/download/v0.26.0/gostyle_v0.26.0_darwin_arm64.zip'
      sha256 '59bea0d12391e8994cf29697476a78858d7a0467e40b5fadb822b17514c7da3a'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/gostyle/releases/download/v0.26.0/gostyle_v0.26.0_darwin_amd64.zip'
      sha256 '7a44a7210fb1fa23c122d96b863075e11f22bb8b0cdf6a354c87c8c9acd044ed'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/gostyle/releases/download/v0.26.0/gostyle_v0.26.0_linux_arm64.tar.gz'
      sha256 'adfb2860cfc18a25422c895d1adca3011bd3650fab23b32f400503114e92e45f'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/gostyle/releases/download/v0.26.0/gostyle_v0.26.0_linux_amd64.tar.gz'
      sha256 '53256c07c40e754c1fe6e4bc6bee7ecbf0e803c6e4147cba78060e6a417d5757'
    end
  end

  head do
    url 'https://github.com/k1LoW/gostyle.git'
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    bin.install 'gostyle'
  end
end
