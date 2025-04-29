class TblsBuild < Formula
  desc 'tbls-build is an external subcommand of tbls for customizing config file of tbls using other tbls.yml or schema.json.'
  version '0.7.2'
  homepage 'https://github.com/k1LoW/tbls-build'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/tbls-build/releases/download/v0.7.2/tbls-build_v0.7.2_darwin_arm64.zip'
      sha256 '0e03c2ff45a85e0cb2ef067371da0743f0a436778e375b832e869e45c57e9f13'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls-build/releases/download/v0.7.2/tbls-build_v0.7.2_darwin_amd64.zip'
      sha256 'cefed3ee042f5e42719163f0027544ac4850602dd655821994c1a361bb3cca69'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/tbls-build/releases/download/v0.7.2/tbls-build_v0.7.2_linux_arm64.tar.gz'
      sha256 'e73a6ac2ab3b391257a9e16ba178707656b101c1a0084e13591b79cc37e86ab2'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls-build/releases/download/v0.7.2/tbls-build_v0.7.2_linux_amd64.tar.gz'
      sha256 'ceae6735259c300d5cdc668fc0b230c9aa410df0025cb2aa1f93aa906d3fef2a'
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
