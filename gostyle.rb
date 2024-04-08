class Gostyle < Formula
  version '0.19.1'
  homepage 'https://github.com/k1LoW/gostyle'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/gostyle/releases/download/v0.19.1/gostyle_v0.19.1_darwin_arm64.zip'
      sha256 '309e8617161a8ab0257bc0cfcbcbe38ecaa6d7793e0e2345645f5ea6844a375f'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/gostyle/releases/download/v0.19.1/gostyle_v0.19.1_darwin_amd64.zip'
      sha256 '711759d1250f86955983106e1f7e488c754a6d5e982e16076e6fb119890d6ac1'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/gostyle/releases/download/v0.19.1/gostyle_v0.19.1_linux_arm64.tar.gz'
      sha256 '984bb17d63e1e5fd6f50ae65100665bb2bd27f818ff9bc0f63b050f7875b5ac7'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/gostyle/releases/download/v0.19.1/gostyle_v0.19.1_linux_amd64.tar.gz'
      sha256 '3e739a58745b163044719167ed8cf495c8914b1e5d014b44a93463b7066f9785'
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
