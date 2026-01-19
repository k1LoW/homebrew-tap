class Octocov < Formula
  desc 'octocov is a toolkit for collecting code metrics (code coverage, code to test ratio and test execution time).'
  version '0.74.2'
  license "MIT"
  homepage 'https://github.com/k1LoW/octocov'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.74.2/octocov_v0.74.2_darwin_arm64.zip'
      sha256 '20a6cf6826da90948283a5758dcc59d1133e7cca756707aa07aa541db9a973c3'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.74.2/octocov_v0.74.2_darwin_amd64.zip'
      sha256 '194a19635e36a1508dc0e51c1adfbbfc1e960b6511e75eb0b0c37979e096228f'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.74.2/octocov_v0.74.2_linux_amd64.tar.gz'
      sha256 '8f407017d6f776c2472ff70a95408804c4bb7b8fbe112ef6223b669c9012f6ff'
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
