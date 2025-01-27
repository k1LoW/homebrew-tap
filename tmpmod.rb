class Tmpmod < Formula
  desc 'tmpmod is a tool for temporary use of modified modules.'
  version '0.4.1'
  homepage 'https://github.com/k1LoW/tmpmod'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/tmpmod/releases/download/v0.4.1/tmpmod_v0.4.1_darwin_arm64.zip'
      sha256 '1ebb7ca43e3db013bc3d6ceafcebe9d201e8a1ec9bbe38ba8a8260e5c9135e51'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tmpmod/releases/download/v0.4.1/tmpmod_v0.4.1_darwin_amd64.zip'
      sha256 '6ebedb3e3af87a44e3aba5744637b64559e36a8beebfa0390aab329a0eceaadd'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/tmpmod/releases/download/v0.4.1/tmpmod_v0.4.1_linux_arm64.tar.gz'
      sha256 '257c822d9405e95714956285e2ab762cb8220a5b0d3284be7460420e0640d4b3'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tmpmod/releases/download/v0.4.1/tmpmod_v0.4.1_linux_amd64.tar.gz'
      sha256 'ba36a033f2d085f555f3e8f0cd75b5c11fca429d02906f4583a1fd21def03f00'
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
