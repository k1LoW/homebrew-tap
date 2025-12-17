class TblsBuild < Formula
  desc 'tbls-build is an external subcommand of tbls for customizing config file of tbls using other tbls.yml or schema.json.'
  version '0.8.0'
  homepage 'https://github.com/k1LoW/tbls-build'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/tbls-build/releases/download/v0.8.0/tbls-build_v0.8.0_darwin_arm64.zip'
      sha256 '44773aafea983b874bd0c30f3a462a52f4c4a9f379726a89c7a6c103627375f3'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls-build/releases/download/v0.8.0/tbls-build_v0.8.0_darwin_amd64.zip'
      sha256 '15caadf73babb2985a16542eab9966f9c107824c1dec3dc576c868e860dedda0'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/tbls-build/releases/download/v0.8.0/tbls-build_v0.8.0_linux_arm64.tar.gz'
      sha256 '7f214599804300651ee4ce2399da02e4d10ead2cb3e5ae5867d25b84ee2e70fc'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls-build/releases/download/v0.8.0/tbls-build_v0.8.0_linux_amd64.tar.gz'
      sha256 '8488b1230d8330b993296f7116e71380c9e49ed0c22cb1eddfbb25a915049c48'
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
