class Gostyle < Formula
  version '0.18.3'
  homepage 'https://github.com/k1LoW/gostyle'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/gostyle/releases/download/v0.18.3/gostyle_v0.18.3_darwin_arm64.zip'
      sha256 '56c077680e75c5050b84da051519ed96388fefad4f1a5b61ee95ced4b5d0bb85'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/gostyle/releases/download/v0.18.3/gostyle_v0.18.3_darwin_amd64.zip'
      sha256 'f1d841c3ac38bc654becbccd50fd7753707e82db8228f20ccf273a2408018109'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/gostyle/releases/download/v0.18.3/gostyle_v0.18.3_linux_arm64.tar.gz'
      sha256 '834668cd864d5ad5bc31d999047fbb1bb37763e9fe3fca192e68c1575753a2b0'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/gostyle/releases/download/v0.18.3/gostyle_v0.18.3_linux_amd64.tar.gz'
      sha256 'b7574356ed5c8b25d973295e37bdc8e7ea523bc6194d1e0edf81ca5dd9dc4c7a'
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
