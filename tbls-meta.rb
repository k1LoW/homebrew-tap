class TblsMeta < Formula
  desc 'tbls-meta is an external subcommand of tbls for applying metadata managed by tbls to the datasource.'
  version '0.4.5'
  homepage 'https://github.com/k1LoW/tbls-meta'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/tbls-meta/releases/download/v0.4.5/tbls-meta_v0.4.5_darwin_arm64.zip'
      sha256 'c0024c3d1ea3091188a54939c5a414dfc63d47fa08229e60219ba82f688f10c4'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls-meta/releases/download/v0.4.5/tbls-meta_v0.4.5_darwin_amd64.zip'
      sha256 'a94d5f21ac9c12b37a9b0845c7c8f6dc7e27a4085cf82856c14e5a0909a401e7'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/tbls-meta/releases/download/v0.4.5/tbls-meta_v0.4.5_linux_arm64.tar.gz'
      sha256 'a2749f608c087877615cc00d0b9cba74f29e359a2b9df920ffa51d68548d4203'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls-meta/releases/download/v0.4.5/tbls-meta_v0.4.5_linux_amd64.tar.gz'
      sha256 'ebf6c78ad31af2802c6ce504a4404bc7d6785d38d17996fae3d0569d9138dded'
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
