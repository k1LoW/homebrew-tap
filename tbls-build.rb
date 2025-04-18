class TblsBuild < Formula
  desc 'tbls-build is an external subcommand of tbls for customizing config file of tbls using other tbls.yml or schema.json.'
  version '0.7.1'
  homepage 'https://github.com/k1LoW/tbls-build'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/tbls-build/releases/download/v0.7.1/tbls-build_v0.7.1_darwin_arm64.zip'
      sha256 '8f7a06402eacf4363f5ad482d2e98d8bd681158ac630fb287c6a27083009e4dd'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls-build/releases/download/v0.7.1/tbls-build_v0.7.1_darwin_amd64.zip'
      sha256 '298eb4c7e2980e1d78522c4ef47f900b92d0ddafdc56f6b1e7252f66cd0264d4'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/tbls-build/releases/download/v0.7.1/tbls-build_v0.7.1_linux_arm64.tar.gz'
      sha256 '05ce856e55c01ab8d9e2a7f95b2d5dc13f5d876173a594bbec188748cc8dea22'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls-build/releases/download/v0.7.1/tbls-build_v0.7.1_linux_amd64.tar.gz'
      sha256 '4f7836b41b6d492f9342192e19157f68013f40df0e0bbcf1bb1c5cf7fc8c2e53'
    end
  end

  head do
    url 'https://github.com/k1LoW/tbls-build.git'
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    bin.install 'tbls-build'
    generate_completions_from_executable(bin/'tbls-build', 'completion')
  end
end
