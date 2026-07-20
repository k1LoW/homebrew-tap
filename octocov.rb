class Octocov < Formula
  desc 'octocov is a toolkit for collecting code metrics (code coverage, code to test ratio and test execution time).'
  version '0.75.10'
  license "MIT"
  homepage 'https://github.com/k1LoW/octocov'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.75.10/octocov_v0.75.10_darwin_arm64.zip'
      sha256 'be34473626dbd2f22b2d81a738926c7eae403b1251a008da306e014627283062'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.75.10/octocov_v0.75.10_darwin_amd64.zip'
      sha256 '3711c60c0c9c7581ab527e058d5c26f96a642870b7354cbcfa0628f9adf8780b'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.75.10/octocov_v0.75.10_linux_amd64.tar.gz'
      sha256 '876e89adb2873563575e300893665a37baf262838d1d376ef20805ea19990d78'
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
