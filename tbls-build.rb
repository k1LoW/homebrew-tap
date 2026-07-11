class TblsBuild < Formula
  desc 'tbls-build is an external subcommand of tbls for customizing config file of tbls using other tbls.yml or schema.json.'
  version '0.8.5'
  homepage 'https://github.com/k1LoW/tbls-build'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/tbls-build/releases/download/v0.8.5/tbls-build_v0.8.5_darwin_arm64.zip'
      sha256 '1167188e1989d553f91b7f57b0c59280ba5721cd007e5547501c6278fc89b198'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls-build/releases/download/v0.8.5/tbls-build_v0.8.5_darwin_amd64.zip'
      sha256 '85436c599f74f5f652584dcd7e1550360b634158dc9dbb14bc82e7647071ff0d'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/tbls-build/releases/download/v0.8.5/tbls-build_v0.8.5_linux_arm64.tar.gz'
      sha256 '63b1e4c4675e51fbca43d3dc86d201e7b718aaf60e34f8e64e7211ccc360a5f7'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls-build/releases/download/v0.8.5/tbls-build_v0.8.5_linux_amd64.tar.gz'
      sha256 '745ea12c31432fc276eee4b6340d1110ae99225a6eb5cce7c5e2440a71bebb85'
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
