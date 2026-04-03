class TblsBuild < Formula
  desc 'tbls-build is an external subcommand of tbls for customizing config file of tbls using other tbls.yml or schema.json.'
  version '0.8.3'
  homepage 'https://github.com/k1LoW/tbls-build'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/tbls-build/releases/download/v0.8.3/tbls-build_v0.8.3_darwin_arm64.zip'
      sha256 '0f544f5d3c8b9fa094f59e85666de9d247ffc242cc024860fd18ed8335d15050'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls-build/releases/download/v0.8.3/tbls-build_v0.8.3_darwin_amd64.zip'
      sha256 '9028d90166a6a9e299ec1d2c8220126bed53bbcdec45e4e9ce5ea0931cca0b58'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/tbls-build/releases/download/v0.8.3/tbls-build_v0.8.3_linux_arm64.tar.gz'
      sha256 'b9baea9bde54a594f218b80ab114a9d717c2d5676bdc5c7faef85907dfcf9626'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls-build/releases/download/v0.8.3/tbls-build_v0.8.3_linux_amd64.tar.gz'
      sha256 '28c19fba7f36e4b3fc78842b3a25bcd08443363920b75eec510d1900b15f2aef'
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
