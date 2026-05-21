class Tmpmod < Formula
  desc 'tmpmod is a tool for temporary use of modified modules.'
  version '0.4.5'
  homepage 'https://github.com/k1LoW/tmpmod'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/tmpmod/releases/download/v0.4.5/tmpmod_v0.4.5_darwin_arm64.zip'
      sha256 '52adfe5ba02f9db36fac31079c0b376b2f58ac01469adee65cd0929925a978e9'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tmpmod/releases/download/v0.4.5/tmpmod_v0.4.5_darwin_amd64.zip'
      sha256 '1872b5999c88eaa1035f5a8b7c9e22d305a02023675323e196936106c05adada'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/tmpmod/releases/download/v0.4.5/tmpmod_v0.4.5_linux_arm64.tar.gz'
      sha256 '22a4366a9aa23642ca22cde0a976ec1bc48e34eecae0712f5169c414350cd304'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tmpmod/releases/download/v0.4.5/tmpmod_v0.4.5_linux_amd64.tar.gz'
      sha256 '0103f53ddf1cf58f71ade579eab42615d9395514e9fbe175a6e417e5e84430ea'
    end
  end

  head do
    url 'https://github.com/k1LoW/tmpmod.git'
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    bin.install 'tmpmod'
  end
end
