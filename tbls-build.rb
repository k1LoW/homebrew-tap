class TblsBuild < Formula
  desc 'tbls-build is an external subcommand of tbls for customizing config file of tbls using other tbls.yml or schema.json.'
  version '0.7.3'
  homepage 'https://github.com/k1LoW/tbls-build'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/tbls-build/releases/download/v0.7.3/tbls-build_v0.7.3_darwin_arm64.zip'
      sha256 'b8fc6213e3f31a85e56e9b444bb5f86f93daa543fb1397b584e8ba5fcf706883'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls-build/releases/download/v0.7.3/tbls-build_v0.7.3_darwin_amd64.zip'
      sha256 'a35ae1f1eb567b00d1f8f0b11f9d03c706d43e911c10cab885d7c5d2802fe564'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/tbls-build/releases/download/v0.7.3/tbls-build_v0.7.3_linux_arm64.tar.gz'
      sha256 '65dc8e302a1c34ff02603dd7de6b927c621d500033a3ffcfb560081d433ad146'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls-build/releases/download/v0.7.3/tbls-build_v0.7.3_linux_amd64.tar.gz'
      sha256 'b8b19e87e3f67b71f361ad705528e8964a3f6556c5821dfafa32701bcb005de1'
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
