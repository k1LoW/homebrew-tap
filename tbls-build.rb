class TblsBuild < Formula
  desc 'tbls-build is an external subcommand of tbls for customizing config file of tbls using other tbls.yml or schema.json.'
  version '0.7.0'
  homepage 'https://github.com/k1LoW/tbls-build'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/tbls-build/releases/download/v0.7.0/tbls-build_v0.7.0_darwin_arm64.zip'
      sha256 '4c1ccdc7368f4c48a24f09122fe234fca594c59b7e9354e4c1cff8e480e8e3aa'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls-build/releases/download/v0.7.0/tbls-build_v0.7.0_darwin_amd64.zip'
      sha256 'fb7f7c6354635b9ffaacb73fed92727834cfec88ed6d6b485561fb5f2236501d'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/tbls-build/releases/download/v0.7.0/tbls-build_v0.7.0_linux_arm64.tar.gz'
      sha256 'de6723da9c2b1fbc54d4d5eff7f4313bd840f9ec6fd22211334392525f5a3aa1'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls-build/releases/download/v0.7.0/tbls-build_v0.7.0_linux_amd64.tar.gz'
      sha256 'f620fa51ffad7658b8b6ca1bda5741c18ca04f2296f841e25e4e88cdd2496ca8'
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
