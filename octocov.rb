class Octocov < Formula
  desc 'octocov is a toolkit for collecting code metrics (code coverage, code to test ratio and test execution time).'
  version '0.62.4'
  license "MIT"
  homepage 'https://github.com/k1LoW/octocov'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.62.4/octocov_v0.62.4_darwin_arm64.zip'
      sha256 '5e35e359b314d5a02f8a8a25b565ccb94f242d330808d4ed433aea349d18d933'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.62.4/octocov_v0.62.4_darwin_amd64.zip'
      sha256 '6fcf145c782b19d9d11e9ca5a27b1c47731e37527d23fe0df8602cc626af5ba0'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.62.4/octocov_v0.62.4_linux_amd64.tar.gz'
      sha256 'd6f8055012bceb1c3f2e86380aa96d50c32ffea6375a353fc1a932565c248305'
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
