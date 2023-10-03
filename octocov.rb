class Octocov < Formula
  desc 'octocov is a toolkit for collecting code metrics (code coverage, code to test ratio and test execution time).'
  version '0.54.1'
  license "MIT"
  homepage 'https://github.com/k1LoW/octocov'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.54.1/octocov_v0.54.1_darwin_arm64.zip'
      sha256 '861a227f290dde971a19ecdacf970f5cbbf74ed9d7712d329a42f0fcd0783eeb'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.54.1/octocov_v0.54.1_darwin_amd64.zip'
      sha256 'f19b0d6f061f0e8c37deccceda67a66079ed5ecbcc576f4c9c1243a10d87ff22'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.54.1/octocov_v0.54.1_linux_amd64.tar.gz'
      sha256 '3cf1e1510f92cc78e2a39c4a0d96c6d082cc8a51cbadeee631dba331f8b27f49'
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
