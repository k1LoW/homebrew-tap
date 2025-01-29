class Gostyle < Formula
  version '0.20.4'
  homepage 'https://github.com/k1LoW/gostyle'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/gostyle/releases/download/v0.20.4/gostyle_v0.20.4_darwin_arm64.zip'
      sha256 '8e3b02fdad75f676346b1383d2e2c56286029fbcfdcb6d61200577886ee45d07'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/gostyle/releases/download/v0.20.4/gostyle_v0.20.4_darwin_amd64.zip'
      sha256 'f92382ad581c536a4e814009c0588491365afb7b5a5b9c4079d5aa1457764b3f'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/gostyle/releases/download/v0.20.4/gostyle_v0.20.4_linux_arm64.tar.gz'
      sha256 '4793a20eed9fe6f67d10789fa2451ac717fca440f01293870aa871ce7470568c'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/gostyle/releases/download/v0.20.4/gostyle_v0.20.4_linux_amd64.tar.gz'
      sha256 '3c42e4844727b768a0cd8391412824761620bee0c82605c3873e7c3c9f181acf'
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
