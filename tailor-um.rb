class TailorUm < Formula
  version '0.4.0'
  homepage 'https://github.com/k1LoW/tailor-um'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/tailor-um/releases/download/v0.4.0/tailor-um_v0.4.0_darwin_arm64.zip'
      sha256 'bf1dee2e2fcacd76ccea25f195a103316ba3e25d8f4518e64120cd4edb3a9fa9'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tailor-um/releases/download/v0.4.0/tailor-um_v0.4.0_darwin_amd64.zip'
      sha256 'b9c1e9572baac7c4081a9745ba04518a06ca525a0b7b49e189b375f691934df5'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/tailor-um/releases/download/v0.4.0/tailor-um_v0.4.0_linux_arm64.tar.gz'
      sha256 '0222ebd3e12ecdc74be16fc377d9511f9260d2c61fc5154f589e70a9915b363d'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tailor-um/releases/download/v0.4.0/tailor-um_v0.4.0_linux_amd64.tar.gz'
      sha256 '40c6faf68ae3c218382e677461b569cd3fc27fd09c665d380a1f62e72f7a314a'
    end
  end

  head do
    url 'https://github.com/k1LoW/tailor-um.git'
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    bin.install 'tailor-um'
  end
end
