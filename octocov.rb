class Octocov < Formula
  desc 'octocov is a toolkit for collecting code metrics (code coverage, code to test ratio and test execution time).'
  version '0.54.2'
  license "MIT"
  homepage 'https://github.com/k1LoW/octocov'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.54.2/octocov_v0.54.2_darwin_arm64.zip'
      sha256 '3c2930db580d00ac098bc4b1aeaeeb8b9a2c892e0fe8d5163fe977fc2df0c610'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.54.2/octocov_v0.54.2_darwin_amd64.zip'
      sha256 'df74701d1710f6fee8f4394d378aadc93a6b521ae1459aa61d9698f1ba7b4fb3'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.54.2/octocov_v0.54.2_linux_amd64.tar.gz'
      sha256 'db88696c83cef5bc72c0c7688222729e0cd20f5efbde474993b1366633259678'
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
