class TailorUm < Formula
  version '0.2.1'
  homepage 'https://github.com/k1LoW/tailor-um'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/tailor-um/releases/download/v0.2.1/tailor-um_v0.2.1_darwin_arm64.zip'
      sha256 '7cff9e8badca6fa8e5d2961947366238607e78fdefde7a1064b0539bd0f62c41'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tailor-um/releases/download/v0.2.1/tailor-um_v0.2.1_darwin_amd64.zip'
      sha256 '87aa9a855953b0f1c7ed0d25f95c55884583fe17205af509ef44f33ac31c1570'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/tailor-um/releases/download/v0.2.1/tailor-um_v0.2.1_linux_arm64.tar.gz'
      sha256 '40a959d725f5e73bad2684b2191bd9b15993df0b134e703d07caf1e119c203a5'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tailor-um/releases/download/v0.2.1/tailor-um_v0.2.1_linux_amd64.tar.gz'
      sha256 '01508b930a01a4ff11920c9930bbc73d689935aee948d56b1d82b5c4dd633bca'
    end
  end

  head do
    url 'https://github.com/k1LoW/tailor-um.git'
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    bin.install 'tailor-um'
  end
end
