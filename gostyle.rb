class Gostyle < Formula
  version '0.20.3'
  homepage 'https://github.com/k1LoW/gostyle'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/gostyle/releases/download/v0.20.3/gostyle_v0.20.3_darwin_arm64.zip'
      sha256 '291ac632764efe4a5eb162a0f00aa0e198226e5e7a6811ebcc474380c9f458fd'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/gostyle/releases/download/v0.20.3/gostyle_v0.20.3_darwin_amd64.zip'
      sha256 'c4cd3eb182e591be2f0b3f63ee593ecc419b3f00c1a24633357ef4b03b00aea2'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/gostyle/releases/download/v0.20.3/gostyle_v0.20.3_linux_arm64.tar.gz'
      sha256 'c257be5573a3e2ec78112857edb62b6c0ecd769869c9228a85c465dd09567ee4'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/gostyle/releases/download/v0.20.3/gostyle_v0.20.3_linux_amd64.tar.gz'
      sha256 '0cf1f4b07bbafc9caccfd7de01ded8380c5a788125b7e69e607392b3c2c0b86d'
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
