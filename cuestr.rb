class Cuestr < Formula
  desc 'cuestr is a utility tool for string literals in CUE files.'
  version '0.4.0'
  homepage 'https://github.com/k1LoW/cuestr'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/cuestr/releases/download/v0.4.0/cuestr_v0.4.0_darwin_arm64.zip'
      sha256 '895d30d83a59cbda7a654454eed1d5159402c526e9c3a2108b836bc9d485c5cd'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/cuestr/releases/download/v0.4.0/cuestr_v0.4.0_darwin_amd64.zip'
      sha256 'ac6472e9f6aec3e3641750e9f0b39a8dd9e00080c3e2107bbe02b1737c312bbc'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/cuestr/releases/download/v0.4.0/cuestr_v0.4.0_linux_arm64.tar.gz'
      sha256 'b52e9b6e499ed493a4ad35ab779accd2f0bbd2a3576635ee90dbb6347029eef7'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/cuestr/releases/download/v0.4.0/cuestr_v0.4.0_linux_amd64.tar.gz'
      sha256 '3cb21b118278371fa1d64106e35d0bbd0f38bd29ffef8d93d34dc5e7a1463d2b'
    end
  end

  head do
    url 'https://github.com/k1LoW/cuestr.git'
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    bin.install 'cuestr'
  end
end
