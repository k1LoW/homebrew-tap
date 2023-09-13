class Gostyle < Formula
  version '0.7.1'
  homepage 'https://github.com/k1LoW/gostyle'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/gostyle/releases/download/v0.7.1/gostyle_v0.7.1_darwin_arm64.zip'
      sha256 '440cc65175843c6b306f4a6b2eebd335292aea503bea177d5450e28c1b78379d'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/gostyle/releases/download/v0.7.1/gostyle_v0.7.1_darwin_amd64.zip'
      sha256 '29d55e329349ce0495ee777cc6264031281cc536d9239cd73f501cdde845a845'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/gostyle/releases/download/v0.7.1/gostyle_v0.7.1_linux_arm64.tar.gz'
      sha256 '261f953db9173698e149cc54c0cde04588fee6fb6f03c4c48721c3a3a34b2f2e'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/gostyle/releases/download/v0.7.1/gostyle_v0.7.1_linux_amd64.tar.gz'
      sha256 '16f74dd072222ef38c8f4e6959e370b86d854371e8e982fe2467ba99e4db4ef0'
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
