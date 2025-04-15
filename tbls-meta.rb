class TblsMeta < Formula
  desc 'tbls-meta is an external subcommand of tbls for applying metadata managed by tbls to the datasource.'
  version '0.4.0'
  homepage 'https://github.com/k1LoW/tbls-meta'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/tbls-meta/releases/download/v0.4.0/tbls-meta_v0.4.0_darwin_arm64.zip'
      sha256 '0f73f54834f25720e65563a62f18f1c5c759c1601f52c8ee0a1904d86fd93afc'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls-meta/releases/download/v0.4.0/tbls-meta_v0.4.0_darwin_amd64.zip'
      sha256 '00663a0f71f6e66bbc87560f772fc09c0897a2d2e93bad2f8d6574f3f92a6092'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/tbls-meta/releases/download/v0.4.0/tbls-meta_v0.4.0_linux_arm64.tar.gz'
      sha256 'f740bde8fde534deaabc27898127d9fb4a8148be3fb549d4786499018d80e486'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls-meta/releases/download/v0.4.0/tbls-meta_v0.4.0_linux_amd64.tar.gz'
      sha256 'e5b70078baa62b686aed92320db33e87bb4766fb525544f7ee283c78d749b0db'
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
