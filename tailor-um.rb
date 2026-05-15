class TailorUm < Formula
  version '0.3.0'
  homepage 'https://github.com/k1LoW/tailor-um'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/tailor-um/releases/download/v0.3.0/tailor-um_v0.3.0_darwin_arm64.zip'
      sha256 '9a03ccfa49c6693b8de871d84a582a558cac4078c5b93d67b993b2b204e4bd00'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tailor-um/releases/download/v0.3.0/tailor-um_v0.3.0_darwin_amd64.zip'
      sha256 'b8942dbd461bd4e2cecd8389dc8d5e37210e858c2333ad35340ed65099cb2595'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/tailor-um/releases/download/v0.3.0/tailor-um_v0.3.0_linux_arm64.tar.gz'
      sha256 'f180e31e28d0a73254a27e38182e1e7784359ee1c5229c6e5d8b15033d5fb3b3'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tailor-um/releases/download/v0.3.0/tailor-um_v0.3.0_linux_amd64.tar.gz'
      sha256 '5a545c09c6b9ed29688c7b42e83db6eef91607139b0d21f8134631aa9823edc5'
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
