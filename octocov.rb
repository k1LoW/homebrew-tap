class Octocov < Formula
  desc 'octocov is a toolkit for collecting code metrics (code coverage, code to test ratio and test execution time).'
  version '0.77.0'
  license "MIT"
  homepage 'https://github.com/k1LoW/octocov'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.77.0/octocov_v0.77.0_darwin_arm64.zip'
      sha256 'ce1a47ac5e912f99d662185b87727e72843423c92549890fcde7b1acd0bca83f'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.77.0/octocov_v0.77.0_darwin_amd64.zip'
      sha256 '15b69c2c9c0a6213dc4d7f2632d117596024d2a29bd23ee356b3d196ea127c8b'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.77.0/octocov_v0.77.0_linux_amd64.tar.gz'
      sha256 '2f9032c0484f719cf773a9b6d479e4b6ab4689388fa4b0c84be89a9eb35d60b4'
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
