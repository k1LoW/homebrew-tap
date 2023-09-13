class Gostyle < Formula
  version '0.9.0'
  homepage 'https://github.com/k1LoW/gostyle'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/gostyle/releases/download/v0.9.0/gostyle_v0.9.0_darwin_arm64.zip'
      sha256 '18e92591b9c69805116241c595bafebf86a0b308c480d71b7f7134dfe7f92cbe'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/gostyle/releases/download/v0.9.0/gostyle_v0.9.0_darwin_amd64.zip'
      sha256 'd7a7fc305ff16a6193552af4b1b362fb3a7e5764ec354b52fc0a665eac2acbfe'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/gostyle/releases/download/v0.9.0/gostyle_v0.9.0_linux_arm64.tar.gz'
      sha256 '6f4c3bcb6e451d4801e78591dca8d3f5858248888e0e173c5cb0a3344cc2450d'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/gostyle/releases/download/v0.9.0/gostyle_v0.9.0_linux_amd64.tar.gz'
      sha256 'd068651c81334047afe8ba7bb7903eddf09974962c33ef38af9e59ae4fef11f1'
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
