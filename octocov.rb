class Octocov < Formula
  desc 'octocov is a toolkit for collecting code metrics (code coverage, code to test ratio and test execution time).'
  version '0.67.0'
  license "MIT"
  homepage 'https://github.com/k1LoW/octocov'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.67.0/octocov_v0.67.0_darwin_arm64.zip'
      sha256 'd1ad59df20bbe949816a2754e7342bfc67ec22a7be14b4c833cfa1394564e9b5'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.67.0/octocov_v0.67.0_darwin_amd64.zip'
      sha256 'd264a0ff7395eeaca841797e740e9270c4b06232ae6787883c408a288c36b0c4'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.67.0/octocov_v0.67.0_linux_amd64.tar.gz'
      sha256 'a1d924b9a59f5b8d5995b6bc20ee538303c935a7ef749808c77c3c3bc883a7b8'
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
