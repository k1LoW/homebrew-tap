class Octocov < Formula
  desc 'octocov is a toolkit for collecting code metrics (code coverage, code to test ratio and test execution time).'
  version '0.71.0'
  license "MIT"
  homepage 'https://github.com/k1LoW/octocov'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.71.0/octocov_v0.71.0_darwin_arm64.zip'
      sha256 '1585e4a09c6f5591aa6c1868090228d18ee0be9bf16fd5a3e20f27f24579c238'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.71.0/octocov_v0.71.0_darwin_amd64.zip'
      sha256 'dfa87ce4520b2e3d0008a4daab1bff503ea012031c049ccf57dac9e002ca4af0'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.71.0/octocov_v0.71.0_linux_amd64.tar.gz'
      sha256 '6bccc2d01ae0dbb9d4e85a3b25867d22cc7fe271123c21db0b301f17d37e734d'
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
