class Envdo < Formula
  version '0.1.0'
  homepage 'https://github.com/k1LoW/envdo'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/envdo/releases/download/v0.1.0/envdo_v0.1.0_darwin_arm64.zip'
      sha256 '04621a3c1a16938e0e29c11a933d8061b210b875852dfc2dbd68071223573caa'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/envdo/releases/download/v0.1.0/envdo_v0.1.0_darwin_amd64.zip'
      sha256 '7f43611614e9d604244272c70014d84124da2279a54398c863802576e37ce494'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/envdo/releases/download/v0.1.0/envdo_v0.1.0_linux_arm64.tar.gz'
      sha256 'bf2321489f6601e2d9eedb4864fbc96c8f85adef6550632bd6eeba831c749606'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/envdo/releases/download/v0.1.0/envdo_v0.1.0_linux_amd64.tar.gz'
      sha256 '75f95fde1067553dbbc3c8c4b3e243f3ea31a4e057d52093bbc0076d628819ed'
    end
  end

  head do
    url 'https://github.com/k1LoW/envdo.git'
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    bin.install 'envdo'
  end
end
