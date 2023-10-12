class TblsBuild < Formula
  desc 'tbls-build is an external subcommand of tbls for customizing config file of tbls using other tbls.yml or schema.json.'
  version '0.4.2'
  homepage 'https://github.com/k1LoW/tbls-build'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/tbls-build/releases/download/v0.4.2/tbls-build_v0.4.2_darwin_arm64.zip'
      sha256 'f7a52cee550d85fd33894224deab7ee22470fc457a7e2c7819f52a2ea3bd1cc3'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls-build/releases/download/v0.4.2/tbls-build_v0.4.2_darwin_amd64.zip'
      sha256 '01d7b72534c8d78e6f3552e09b907bd0cc43ad6ab61b44855b00136a95fa076c'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/tbls-build/releases/download/v0.4.2/tbls-build_v0.4.2_linux_arm64.tar.gz'
      sha256 '126bfb0e36e4eb906bf84fb228a855c2e9772ba9b21217c7714d59a7f2ff911b'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls-build/releases/download/v0.4.2/tbls-build_v0.4.2_linux_amd64.tar.gz'
      sha256 'e7225bbd453b3fc25b0245d1faa7f84ac58dac006dd318aa767daeaf789af58c'
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
