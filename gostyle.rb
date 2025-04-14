class Gostyle < Formula
  version '0.21.1'
  homepage 'https://github.com/k1LoW/gostyle'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/gostyle/releases/download/v0.21.1/gostyle_v0.21.1_darwin_arm64.zip'
      sha256 'af3aba9df4426aa576299eff22896d9b861ae240e6125747a822e2fb044347d5'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/gostyle/releases/download/v0.21.1/gostyle_v0.21.1_darwin_amd64.zip'
      sha256 '2124168285ab6d1bd7f33a18968fbf270efebbb6b76812722f34ee855a53358b'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/gostyle/releases/download/v0.21.1/gostyle_v0.21.1_linux_arm64.tar.gz'
      sha256 'b12da547b66bfb81f060c53fa3e366c6513da632e44eea666ede3f2d83a769d3'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/gostyle/releases/download/v0.21.1/gostyle_v0.21.1_linux_amd64.tar.gz'
      sha256 '099d3739c9c608caa254bcbd5fe0bb347d8560fe58296c93996bf11c8eb3042e'
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
