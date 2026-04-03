class Octocov < Formula
  desc 'octocov is a toolkit for collecting code metrics (code coverage, code to test ratio and test execution time).'
  version '0.75.6'
  license "MIT"
  homepage 'https://github.com/k1LoW/octocov'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.75.6/octocov_v0.75.6_darwin_arm64.zip'
      sha256 '939d24a80816aec3643ed89e89c1351a7f3b4588c12d20637ee2113d41f31b56'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.75.6/octocov_v0.75.6_darwin_amd64.zip'
      sha256 '5b0bd24a016c54a1dea0639b488a31f2d116acd850b445e87cd60f7403dfd4ef'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.75.6/octocov_v0.75.6_linux_amd64.tar.gz'
      sha256 'd32cc12565b25f5bd9cb7643cb8bc3b2a1844c6f402f62f68ebe3c36e3c3c326'
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
