class TblsMeta < Formula
  desc 'tbls-meta is an external subcommand of tbls for applying metadata managed by tbls to the datasource.'
  version '0.4.6'
  homepage 'https://github.com/k1LoW/tbls-meta'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/tbls-meta/releases/download/v0.4.6/tbls-meta_v0.4.6_darwin_arm64.zip'
      sha256 'dd2ef22a2eb447e358b7eedf64b16f6b71e405eb5daba19379a7e7e41f81ffd4'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls-meta/releases/download/v0.4.6/tbls-meta_v0.4.6_darwin_amd64.zip'
      sha256 '351dda378d1a2bd8e8f3d44bb58a3d88c04c54868910c93e6c5a1555f4f0bd11'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/tbls-meta/releases/download/v0.4.6/tbls-meta_v0.4.6_linux_arm64.tar.gz'
      sha256 '3f632db0dca202b1d7077b001b90c38beb8963b5f529eafaab2d551b770edc7a'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls-meta/releases/download/v0.4.6/tbls-meta_v0.4.6_linux_amd64.tar.gz'
      sha256 '52b3cc253a5fd9d818a69317e522b03cd538211c8ee07f51c17da689c96ceef4'
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
