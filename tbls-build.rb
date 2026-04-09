class TblsBuild < Formula
  desc 'tbls-build is an external subcommand of tbls for customizing config file of tbls using other tbls.yml or schema.json.'
  version '0.8.4'
  homepage 'https://github.com/k1LoW/tbls-build'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/tbls-build/releases/download/v0.8.4/tbls-build_v0.8.4_darwin_arm64.zip'
      sha256 'b6e28db01b9a01a8ff585c48fe15570b30b480885ebe87140b4cef0ab297a44b'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls-build/releases/download/v0.8.4/tbls-build_v0.8.4_darwin_amd64.zip'
      sha256 'fb57293c557c324bb3be5027459e137e98a9044e950a2cb7520e700bc5b6c1e9'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/tbls-build/releases/download/v0.8.4/tbls-build_v0.8.4_linux_arm64.tar.gz'
      sha256 '6ead3617de5d24b0251ddc55ee473817273e890bc7bbc1a83cca087f7abfd13b'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls-build/releases/download/v0.8.4/tbls-build_v0.8.4_linux_amd64.tar.gz'
      sha256 '08ce2bbdeccf90cb953ba1bc2369b76ebc2aebae4a183628e18f316533b39d64'
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
