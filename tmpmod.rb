class Tmpmod < Formula
  desc 'tmpmod is a tool for temporary use of modified modules.'
  version '0.4.3'
  homepage 'https://github.com/k1LoW/tmpmod'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/tmpmod/releases/download/v0.4.3/tmpmod_v0.4.3_darwin_arm64.zip'
      sha256 '27da62327ce29683383dc29155c8a92f8572eb764aab18ebf6a35fa59ae3c944'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tmpmod/releases/download/v0.4.3/tmpmod_v0.4.3_darwin_amd64.zip'
      sha256 'aaa3aed77e1323828c5e6b670595129e590ae3fbedb90da43271b45904ad3b26'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/tmpmod/releases/download/v0.4.3/tmpmod_v0.4.3_linux_arm64.tar.gz'
      sha256 'f90e1e3d4309fd8bdde609ba5febe5e7b1e7d97732fed3d9af08e3b60dbd39a3'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tmpmod/releases/download/v0.4.3/tmpmod_v0.4.3_linux_amd64.tar.gz'
      sha256 '2d17adcdccaa9319d09159e2ed78215a4cfa86ed3fc6796fe90f224f2abfe934'
    end
  end

  head do
    url 'https://github.com/k1LoW/tmpmod.git'
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    bin.install 'tmpmod'
  end
end
