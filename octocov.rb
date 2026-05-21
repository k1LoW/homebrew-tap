class Octocov < Formula
  desc 'octocov is a toolkit for collecting code metrics (code coverage, code to test ratio and test execution time).'
  version '0.75.8'
  license "MIT"
  homepage 'https://github.com/k1LoW/octocov'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.75.8/octocov_v0.75.8_darwin_arm64.zip'
      sha256 'c09bb0ecf98f588866167bf69eb83dd8b46eb39592a53c4b6f2e7bf7c2fed8db'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.75.8/octocov_v0.75.8_darwin_amd64.zip'
      sha256 '751b9ebc25534102d4bf0e3660acf40652f6ccee8f2080492d670d9263598015'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.75.8/octocov_v0.75.8_linux_amd64.tar.gz'
      sha256 '6c8451a3c1e535e47e60e681e69c35676d09bc9260d01ea904565c6d05138eee'
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
