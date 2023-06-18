class TblsBuild < Formula
  desc 'tbls-build is an external subcommand of tbls for customizing config file of tbls using other tbls.yml or schema.json.'
  version '0.4.1'
  homepage 'https://github.com/k1LoW/tbls-build'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/tbls-build/releases/download/v0.4.1/tbls-build_v0.4.1_darwin_arm64.zip'
      sha256 '91e26549389a970ad810d0e795505117303f68cfb2d3f642b4c23a33612661ed'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls-build/releases/download/v0.4.1/tbls-build_v0.4.1_darwin_amd64.zip'
      sha256 '39cc9f7bd894de00742fe8a75a2ed9ff13e3fe73ed83665a1ca815d8af80a06c'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/tbls-build/releases/download/v0.4.1/tbls-build_v0.4.1_linux_arm64.tar.gz'
      sha256 '76ba8e46cf3b665ee4140bd688e58041622cfae989e5fca07bbf96dbb64e75b6'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls-build/releases/download/v0.4.1/tbls-build_v0.4.1_linux_amd64.tar.gz'
      sha256 'f4e3db1c8969371619014a6662486169683e78cab10adf77b1b1f10a8b6e7aa5'
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
