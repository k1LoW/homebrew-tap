class Tmpmod < Formula
  desc 'tmpmod is a tool for temporary use of modified modules.'
  version '0.4.7'
  homepage 'https://github.com/k1LoW/tmpmod'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/tmpmod/releases/download/v0.4.7/tmpmod_v0.4.7_darwin_arm64.zip'
      sha256 '0d0acebfa79bb0478f2dc5af680311f15691a646a524fb4305cf92786c62fac7'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tmpmod/releases/download/v0.4.7/tmpmod_v0.4.7_darwin_amd64.zip'
      sha256 '3e36f607fd8adcbe677887dee7506ec98880be13905f4ac4549e3125eb749e44'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/tmpmod/releases/download/v0.4.7/tmpmod_v0.4.7_linux_arm64.tar.gz'
      sha256 '7869b4ecbe93b38625a0568e15c7da60b1cb131602f26886ca3da67fc6b2450f'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tmpmod/releases/download/v0.4.7/tmpmod_v0.4.7_linux_amd64.tar.gz'
      sha256 'c99d91dbf12ac97ce72ba0390f9ccad063ad01f4c4c80ba57acb791c2585d563'
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
