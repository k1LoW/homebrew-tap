class GhGrep < Formula
  desc ':octocat: Print lines matching a pattern in repositories using GitHub API'
  version '1.2.3'
  homepage 'https://github.com/k1LoW/gh-grep'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/gh-grep/releases/download/v1.2.3/gh-grep_v1.2.3_darwin_arm64.zip'
      sha256 '87f21688ed0291b4f3946732c91dfbcab451383d2d2f148f5a5004f045e2ff90'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/gh-grep/releases/download/v1.2.3/gh-grep_v1.2.3_darwin_amd64.zip'
      sha256 '569e34d64cdc6cafbadd04b25354b345ff1d1c12b45bba5f76f791885b27c27f'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/gh-grep/releases/download/v1.2.3/gh-grep_v1.2.3_linux_arm64.tar.gz'
      sha256 '20a293c07f2e65b0d3fe1ed2f37f24b7130577adcd3b27bcfb2453d5e93d255b'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/gh-grep/releases/download/v1.2.3/gh-grep_v1.2.3_linux_amd64.tar.gz'
      sha256 '391f261e4f17ae8a9c8e3f431eebf14b807b9ab553240ae5c27f973241d809bb'
    end
  end

  head do
    url 'https://github.com/k1LoW/gh-grep.git'
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    bin.install 'gh-grep'
  end
end
