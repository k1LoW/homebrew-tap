class Octocov < Formula
  desc 'octocov is a toolkit for collecting code metrics (code coverage, code to test ratio and test execution time).'
  version '0.54.6'
  license "MIT"
  homepage 'https://github.com/k1LoW/octocov'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.54.6/octocov_v0.54.6_darwin_arm64.zip'
      sha256 'd4a6c68a44e4b72d47468fef4d38c78c6b3ec7394c04a6289c0a38d6373956f2'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.54.6/octocov_v0.54.6_darwin_amd64.zip'
      sha256 'c50bde93ab507aec69ea64a64519273becc535d3834d62b203896a5d0d637b05'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.54.6/octocov_v0.54.6_linux_amd64.tar.gz'
      sha256 '31c11047b8acd3824a7810c942d4c1c3a876920d797272d8ce94e91551245ea9'
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
