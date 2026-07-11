class TblsMeta < Formula
  desc 'tbls-meta is an external subcommand of tbls for applying metadata managed by tbls to the datasource.'
  version '0.4.10'
  homepage 'https://github.com/k1LoW/tbls-meta'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/tbls-meta/releases/download/v0.4.10/tbls-meta_v0.4.10_darwin_arm64.zip'
      sha256 '61d3019341e4f4ebc1fbf5f9689008e86e5e4c3d2f05787bdb0bd9652905497a'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls-meta/releases/download/v0.4.10/tbls-meta_v0.4.10_darwin_amd64.zip'
      sha256 '5c6020765b695c9ca5d2338610563215ccf183c701314ccef588f76deec3577e'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/tbls-meta/releases/download/v0.4.10/tbls-meta_v0.4.10_linux_arm64.tar.gz'
      sha256 '72085c21ba1a216c267eff7583a29dfe7b7029057c0c1bd1b120efb6e1909cc8'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls-meta/releases/download/v0.4.10/tbls-meta_v0.4.10_linux_amd64.tar.gz'
      sha256 'f9424ba1f7bb233b052ce8a2f371a504716f44a2ca534e852f0fa98bb3f8af15'
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
