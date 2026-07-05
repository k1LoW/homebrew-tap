class TblsMeta < Formula
  desc 'tbls-meta is an external subcommand of tbls for applying metadata managed by tbls to the datasource.'
  version '0.4.9'
  homepage 'https://github.com/k1LoW/tbls-meta'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/tbls-meta/releases/download/v0.4.9/tbls-meta_v0.4.9_darwin_arm64.zip'
      sha256 'fa5127f91c6edfcdbb71051eb8f1eb5f9ae0b75e7470b4fd972485d19b269b43'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls-meta/releases/download/v0.4.9/tbls-meta_v0.4.9_darwin_amd64.zip'
      sha256 '61629c85d8e105d71bd616afb18e1c1139dfad2e74bf1d6fb1055b829a3f20a4'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/tbls-meta/releases/download/v0.4.9/tbls-meta_v0.4.9_linux_arm64.tar.gz'
      sha256 '45cc2f44d8a23c3ddad368ef9dcd24f8e5ffbe927910b0d09c8eb84def0fd7e7'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls-meta/releases/download/v0.4.9/tbls-meta_v0.4.9_linux_amd64.tar.gz'
      sha256 '19543856d28d330c8e3a1f5ae04b2207e8f905ac5ab245ed6d99e181270c3429'
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
