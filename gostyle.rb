class Gostyle < Formula
  version '0.20.2'
  homepage 'https://github.com/k1LoW/gostyle'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/gostyle/releases/download/v0.20.2/gostyle_v0.20.2_darwin_arm64.zip'
      sha256 '412522ee51f6d4987933db689aa37f92f16d524166e8388df4eba62a607d04e2'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/gostyle/releases/download/v0.20.2/gostyle_v0.20.2_darwin_amd64.zip'
      sha256 '2fad0c2a08febd54e9ccb09995e9011aabca04e41ddc8f3034f27a95f10a360d'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/gostyle/releases/download/v0.20.2/gostyle_v0.20.2_linux_arm64.tar.gz'
      sha256 '67e456ea9f8d6fb42b1033edfce5ed8873df99611cb775fcc2747ac78cb88446'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/gostyle/releases/download/v0.20.2/gostyle_v0.20.2_linux_amd64.tar.gz'
      sha256 '2c4946b7a1486f0166f7a7e7382539f524a598813dd40d69042ba836b78343f5'
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
