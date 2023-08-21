class Octocov < Formula
  desc 'octocov is a toolkit for collecting code metrics (code coverage, code to test ratio and test execution time).'
  version '0.50.0'
  license "MIT"
  homepage 'https://github.com/k1LoW/octocov'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.50.0/octocov_v0.50.0_darwin_arm64.zip'
      sha256 '8de6197cac68d8424402e1bf6d72b004e53b0338e79d335fede269abf42a1b26'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.50.0/octocov_v0.50.0_darwin_amd64.zip'
      sha256 '41b1db3303374635d791b5cfcd3b72d6c7fb9eb3b2fbbdb4ae9513595eed8e55'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.50.0/octocov_v0.50.0_linux_amd64.tar.gz'
      sha256 '218ab569c1de5678536b0108a05caa3fe0932c48ce0a78a96aa50b641a437f19'
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
