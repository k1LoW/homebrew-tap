class Octocov < Formula
  desc 'octocov is a toolkit for collecting code metrics (code coverage, code to test ratio and test execution time).'
  version '0.58.0'
  license "MIT"
  homepage 'https://github.com/k1LoW/octocov'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.58.0/octocov_v0.58.0_darwin_arm64.zip'
      sha256 '924828a35fd5d642b322720c832ac1772b9e2acdad129cce4363915bba97fa7b'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.58.0/octocov_v0.58.0_darwin_amd64.zip'
      sha256 'edda3f28547c833b0bc4519fbbf8d983059ea5bd05cd29f43f93fa93a25a0008'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.58.0/octocov_v0.58.0_linux_amd64.tar.gz'
      sha256 '9d47a1fd054b339ca38808e852771f534675f2aef109f789ba7708a216698dd4'
    end
  end

  head do
    url 'https://github.com/k1LoW/octocov.git'
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    bin.install 'octocov'
    generate_completions_from_executable(bin/'octocov', 'completion')
  end
end
