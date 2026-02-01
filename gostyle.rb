class Gostyle < Formula
  version '0.25.3'
  homepage 'https://github.com/k1LoW/gostyle'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/gostyle/releases/download/v0.25.3/gostyle_v0.25.3_darwin_arm64.zip'
      sha256 '74ff1f4a70c22cdc00009acb78739a546085bb9ee6c1fe7aeff93e3ca213d37a'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/gostyle/releases/download/v0.25.3/gostyle_v0.25.3_darwin_amd64.zip'
      sha256 '076532ca457ac9650bf660c1ae8fb921ef591ff70fdce02c04fc6247817c58af'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/gostyle/releases/download/v0.25.3/gostyle_v0.25.3_linux_arm64.tar.gz'
      sha256 '014efb474a0317f5d51cbff21ad75776bb57bc44c465409f3f83aa76451f6054'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/gostyle/releases/download/v0.25.3/gostyle_v0.25.3_linux_amd64.tar.gz'
      sha256 '0745b1ba8a2b5175506cc9a7f9b5e9dd18e6de7c56c584b054500f3d4bca39f5'
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
