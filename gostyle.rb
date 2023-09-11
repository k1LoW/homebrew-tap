class Gostyle < Formula
  version '0.2.0'
  homepage 'https://github.com/k1LoW/gostyle'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/gostyle/releases/download/v0.2.0/gostyle_v0.2.0_darwin_arm64.zip'
      sha256 '27c97564f9bf167a973f9b203e79648a05a0f88673d1c57a65558d1bd7a48baf'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/gostyle/releases/download/v0.2.0/gostyle_v0.2.0_darwin_amd64.zip'
      sha256 '41635b810402c1931df6f9df9998bdb87c9accce0136139c3f9f4c97c8a40d58'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/gostyle/releases/download/v0.2.0/gostyle_v0.2.0_linux_arm64.tar.gz'
      sha256 '66fbe2c5fd9efe74a2aff1c3f79b47893915dfe47bae50ec473ead268bcc0024'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/gostyle/releases/download/v0.2.0/gostyle_v0.2.0_linux_amd64.tar.gz'
      sha256 'fc39eee1b38ac92bd8ac41f78fdec3377b64ffbd933e5a262b53644b3a8f2639'
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
