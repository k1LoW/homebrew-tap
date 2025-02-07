class Roots < Formula
  version '0.3.0'
  homepage 'https://github.com/k1LoW/roots'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/roots/releases/download/v0.3.0/roots_v0.3.0_darwin_arm64.zip'
      sha256 '6ca9cda82874895146f2a101b797d90df623bf5d2f101090215491d37c9f127e'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/roots/releases/download/v0.3.0/roots_v0.3.0_darwin_amd64.zip'
      sha256 'c5695a3e0b7a0571877cd4fd2983b7e04847f29e8e1756dfe313fb15dad5baa2'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/roots/releases/download/v0.3.0/roots_v0.3.0_linux_arm64.tar.gz'
      sha256 '3839075fdca0d1642413d199c0a369276a2c2f3fe2d5433e5212d8d4df214781'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/roots/releases/download/v0.3.0/roots_v0.3.0_linux_amd64.tar.gz'
      sha256 '79cba67a5dcf905f6567bf6201f3ee53b17496bd1d29ded91ab3c87f86d8ee03'
    end
  end

  head do
    url 'https://github.com/k1LoW/roots.git'
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    bin.install 'roots'
  end
end
