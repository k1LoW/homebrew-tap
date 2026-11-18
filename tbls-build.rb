class TblsBuild < Formula
  desc 'tbls-build is an external subcommand of tbls for customizing config file of tbls using other tbls.yml or schema.json.'
  version '0.8.6'
  homepage 'https://github.com/k1LoW/tbls-build'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/tbls-build/releases/download/v0.8.6/tbls-build_v0.8.6_darwin_arm64.zip'
      sha256 '09e6b9005469936c8b2a903b4e193bff56a72818acab32222a3d0489f803c068'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls-build/releases/download/v0.8.6/tbls-build_v0.8.6_darwin_amd64.zip'
      sha256 '9bc544be8895898e25dd2b3a669577c0599a711790c51a17aef7b2d88fe40e47'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/tbls-build/releases/download/v0.8.6/tbls-build_v0.8.6_linux_arm64.tar.gz'
      sha256 'dbc2673691dc7b83102c3d3bbc2b19a9c821a788458fe4999805c13c31c51aa1'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls-build/releases/download/v0.8.6/tbls-build_v0.8.6_linux_amd64.tar.gz'
      sha256 '9ee1d7e85dae19bc32f13dfdf6960b226393571b250c7177a4980f41713d2c2e'
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
