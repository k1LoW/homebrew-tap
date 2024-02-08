class Octocov < Formula
  desc 'octocov is a toolkit for collecting code metrics (code coverage, code to test ratio and test execution time).'
  version '0.57.0'
  license "MIT"
  homepage 'https://github.com/k1LoW/octocov'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.57.0/octocov_v0.57.0_darwin_arm64.zip'
      sha256 'ab8faa43fa369f2a29d18f28f0468920675b0afb0b911744507e4024f9f43418'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.57.0/octocov_v0.57.0_darwin_amd64.zip'
      sha256 '982ea73f3622d19aef452a12841c013a9f74cef98325b0c2ec1e4cbc88cf0ba1'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.57.0/octocov_v0.57.0_linux_amd64.tar.gz'
      sha256 'ae88a636bd1d6bb8774771aeb430dc1c286c27084fc0769a5cabc689a659fb7f'
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
