class Octocov < Formula
  desc 'octocov is a toolkit for collecting code metrics (code coverage, code to test ratio and test execution time).'
  version '0.52.0'
  license "MIT"
  homepage 'https://github.com/k1LoW/octocov'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.52.0/octocov_v0.52.0_darwin_arm64.zip'
      sha256 'f1650e57acb530038a5407e1e48d0aa8ef781bea301703055358cc4c05686050'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.52.0/octocov_v0.52.0_darwin_amd64.zip'
      sha256 '240c7f552e7a871a1ba10d1eb8d0aa29df5993e3b6f6ea7f5e48e5174ab3cb25'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.52.0/octocov_v0.52.0_linux_amd64.tar.gz'
      sha256 '6810025177082105f934e8675ce0214256b831ad1dd1165916059e7e4d0daf03'
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
