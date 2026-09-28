class Gostyle < Formula
  version '0.26.1'
  homepage 'https://github.com/k1LoW/gostyle'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/gostyle/releases/download/v0.26.1/gostyle_v0.26.1_darwin_arm64.zip'
      sha256 'ea23fa83f822199a1b3eb114a15117819e671398a7e624b3f692e4d39fde5d46'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/gostyle/releases/download/v0.26.1/gostyle_v0.26.1_darwin_amd64.zip'
      sha256 '0c7d516b52b4ccd1796b2dccee653ec19c1137a250321f1a3374d85914573631'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/gostyle/releases/download/v0.26.1/gostyle_v0.26.1_linux_arm64.tar.gz'
      sha256 '360ce4c227c75e733d5964dd83aeff8468d98ce6f8b027f71f62c3d03837371a'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/gostyle/releases/download/v0.26.1/gostyle_v0.26.1_linux_amd64.tar.gz'
      sha256 'c19109e2bb11cdfacadab0aca241e958d57f166665648a281d4c8ffa6c149fd5'
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
