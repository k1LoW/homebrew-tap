class Octocov < Formula
  desc 'octocov is a toolkit for collecting code metrics (code coverage, code to test ratio and test execution time).'
  version '0.75.9'
  license "MIT"
  homepage 'https://github.com/k1LoW/octocov'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.75.9/octocov_v0.75.9_darwin_arm64.zip'
      sha256 '8768787124fdb4309251a7545bf7097f7b5855a63bbe6e73992ade0e1307a6c2'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.75.9/octocov_v0.75.9_darwin_amd64.zip'
      sha256 'b1dd4abab7436a840734b18e4dd9078648f7476c9a95d4718b5521625f1e980f'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.75.9/octocov_v0.75.9_linux_amd64.tar.gz'
      sha256 '91b96005c057f67606f4aa5aa4607b54ee484df526a966781f38f2f87a5196f0'
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
