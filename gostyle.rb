class Gostyle < Formula
  version '0.20.0'
  homepage 'https://github.com/k1LoW/gostyle'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/gostyle/releases/download/v0.20.0/gostyle_v0.20.0_darwin_arm64.zip'
      sha256 '428b6c57f3d5f4974435235bc839cab1b7ea7ba49e13c46c620e0d7039def133'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/gostyle/releases/download/v0.20.0/gostyle_v0.20.0_darwin_amd64.zip'
      sha256 '0dbff55718bf2d739516286dc821b24f6ffb2aa874f637b71195994842455629'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/gostyle/releases/download/v0.20.0/gostyle_v0.20.0_linux_arm64.tar.gz'
      sha256 'c880b82561b45f146a37e6e35b11561c2c0d84c44a348f6aa3018daf89f54810'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/gostyle/releases/download/v0.20.0/gostyle_v0.20.0_linux_amd64.tar.gz'
      sha256 '2c6b2d5ffa20c676b692a445a8c5dba2794156f3d67467bd585e00d1ea3b4842'
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
