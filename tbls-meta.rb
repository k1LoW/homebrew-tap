class TblsMeta < Formula
  desc 'tbls-meta is an external subcommand of tbls for applying metadata managed by tbls to the datasource.'
  version '0.4.7'
  homepage 'https://github.com/k1LoW/tbls-meta'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/tbls-meta/releases/download/v0.4.7/tbls-meta_v0.4.7_darwin_arm64.zip'
      sha256 '64b84ed7c5dbfcbbcb32daa26646090b0e47aa7ca9db5772dfd1e06076c62508'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls-meta/releases/download/v0.4.7/tbls-meta_v0.4.7_darwin_amd64.zip'
      sha256 'e2d91b37d80554212e8c49a6af1cd53b6c1b7cbcdcc509d625658f955b061180'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/tbls-meta/releases/download/v0.4.7/tbls-meta_v0.4.7_linux_arm64.tar.gz'
      sha256 'f135729d65f1d2dafbba87a900c1c344ccf882b3d3dcb5dfbc847be27d53b6e2'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls-meta/releases/download/v0.4.7/tbls-meta_v0.4.7_linux_amd64.tar.gz'
      sha256 '57df5796007aa1c73d6191db583989e04bc2ad4b8ce2a63d9dbb35b28c639725'
    end
  end

  head do
    url 'https://github.com/k1LoW/tbls-meta.git'
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    bin.install 'tbls-meta'
    generate_completions_from_executable(bin/'tbls-meta', 'completion')
  end
end
