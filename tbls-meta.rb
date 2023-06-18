class TblsMeta < Formula
  desc 'tbls-meta is an external subcommand of tbls for applying metadata managed by tbls to the datasource.'
  version '0.3.1'
  homepage 'https://github.com/k1LoW/tbls-meta'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/tbls-meta/releases/download/v0.3.1/tbls-meta_v0.3.1_darwin_arm64.zip'
      sha256 '3306d2092b1ee48f80da705f8679116dc55f52945c7e9080a8d7dbc4f8b019a9'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls-meta/releases/download/v0.3.1/tbls-meta_v0.3.1_darwin_amd64.zip'
      sha256 '4ff782bff8bbdcca0b45286cf4d694ebbfe2d26ead47e32dddeda3d61838e702'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/tbls-meta/releases/download/v0.3.1/tbls-meta_v0.3.1_linux_arm64.tar.gz'
      sha256 '486249ba6d838376d81435835f1fc5c403457281174722f637bc4da3e5e29b6a'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls-meta/releases/download/v0.3.1/tbls-meta_v0.3.1_linux_amd64.tar.gz'
      sha256 '5c38d73970e292795e30303520d0d59a9b8a137f233db908f66dd7bec61fe4d2'
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
