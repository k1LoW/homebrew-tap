class Octocov < Formula
  desc 'octocov is a toolkit for collecting code metrics (code coverage, code to test ratio and test execution time).'
  version '0.68.0'
  license "MIT"
  homepage 'https://github.com/k1LoW/octocov'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.68.0/octocov_v0.68.0_darwin_arm64.zip'
      sha256 '3cb14f2caf75f40257f5e6dd9931ddab735104a0a8b746612da612e8e75da38b'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.68.0/octocov_v0.68.0_darwin_amd64.zip'
      sha256 '15b70b5f17c223bc7fee5a8251f116842810a7b5cc963f637a675b3e2419f3f6'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.68.0/octocov_v0.68.0_linux_amd64.tar.gz'
      sha256 'd802ee03b1deaf8e4209a217931f333f8bbb13e6667f3596c4f14bb8c84c0d58'
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
