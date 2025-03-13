class TblsBuild < Formula
  desc 'tbls-build is an external subcommand of tbls for customizing config file of tbls using other tbls.yml or schema.json.'
  version '0.6.0'
  homepage 'https://github.com/k1LoW/tbls-build'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/tbls-build/releases/download/v0.6.0/tbls-build_v0.6.0_darwin_arm64.zip'
      sha256 'fd12e7e624f0589e80152dd00dcea8dbee75e4ff05dbd2997072036369006257'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls-build/releases/download/v0.6.0/tbls-build_v0.6.0_darwin_amd64.zip'
      sha256 '3b50650ac48970aec99c29a44984e59097cb1d47af1e9e707bd0e9445128be6e'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/tbls-build/releases/download/v0.6.0/tbls-build_v0.6.0_linux_arm64.tar.gz'
      sha256 '5d9f3c6d52e4db93bc08a297ca8c4b07de79ea03f4bf9dfff5008c5d4ea5d288'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls-build/releases/download/v0.6.0/tbls-build_v0.6.0_linux_amd64.tar.gz'
      sha256 '806bd20f1f1dd828c308c907a8df5747250990a0ab4e72eddcdfe50cf33682a6'
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
