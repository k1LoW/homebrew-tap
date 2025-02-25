class Cuestr < Formula
  desc 'cuestr is a utility tool for string literals in CUE files.'
  version '0.1.0'
  homepage 'https://github.com/k1LoW/cuestr'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/cuestr/releases/download/v0.1.0/cuestr_v0.1.0_darwin_arm64.zip'
      sha256 '6b5163d9db8a2821a70fe8df5abf86e3b6ba8367dcaf685645a5a8da7a912628'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/cuestr/releases/download/v0.1.0/cuestr_v0.1.0_darwin_amd64.zip'
      sha256 'e5ccd998ae0a861196cb5bfa30c4cc1e5e467447021cb3f63b54877ccf0faab3'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/cuestr/releases/download/v0.1.0/cuestr_v0.1.0_linux_arm64.tar.gz'
      sha256 '98c38749445051116c6928a68b2324c996e5aaa16a53389373d253c04749c4e6'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/cuestr/releases/download/v0.1.0/cuestr_v0.1.0_linux_amd64.tar.gz'
      sha256 '5f8d2ee22c8775f104cd40e684df13110ad9aa5ee04a9f5a02b784008a55d851'
    end
  end

  head do
    url 'https://github.com/k1LoW/cuestr.git'
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    bin.install 'cuestr'
  end
end
