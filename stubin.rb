class Stubin < Formula
  desc 'This is stub binary'
  version '1.0.0'
  homepage 'https://github.com/k1LoW/stubin'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/stubin/releases/download/v1.0.0/stubin_v1.0.0_darwin_arm64.zip'
      sha256 'ee4358a641685a740d66d7fe03aab7c3fbeb5aeec5ea1e34a9f75eec299e574b'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/stubin/releases/download/v1.0.0/stubin_v1.0.0_darwin_amd64.zip'
      sha256 '82f288217ef2acd973f5aa145984f6634dbc7c07b74d727a7db108df26c16e97'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/stubin/releases/download/v1.0.0/stubin_v1.0.0_linux_arm64.tar.gz'
      sha256 'fd629cfad3ef78e930f61ff4e251da1e5f5ddc32d246662046cc112a332aca93'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/stubin/releases/download/v1.0.0/stubin_v1.0.0_linux_amd64.tar.gz'
      sha256 '6ace5fc0f05504a22f6eecb536ce4162e3e57287011c12bce122c72a004a5b89'
    end
  end

  head do
    url 'https://github.com/k1LoW/stubin.git'
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    bin.install 'stubin'
  end
end
