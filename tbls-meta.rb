class TblsMeta < Formula
  desc 'tbls-meta is an external subcommand of tbls for applying metadata managed by tbls to the datasource.'
  version '0.3.3'
  homepage 'https://github.com/k1LoW/tbls-meta'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/tbls-meta/releases/download/v0.3.3/tbls-meta_v0.3.3_darwin_arm64.zip'
      sha256 '79fa5af2536d5c5836ddefc3a298177e691c60d2b8d8f380ca66da2997382acc'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls-meta/releases/download/v0.3.3/tbls-meta_v0.3.3_darwin_amd64.zip'
      sha256 'c186b7fab6df007343220b626a4bbe6fdc1999b09162a73b8488af80cdc97fb7'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/tbls-meta/releases/download/v0.3.3/tbls-meta_v0.3.3_linux_arm64.tar.gz'
      sha256 'a391ca69a40718b72a32aa888eb59813c8c12f077b46d9bc28a48d96b4a31613'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls-meta/releases/download/v0.3.3/tbls-meta_v0.3.3_linux_amd64.tar.gz'
      sha256 'f822b75cd76a4794d1f3f8eebb6547cd56c6ae04dba7c69bc000d523b504fc96'
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
