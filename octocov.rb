class Octocov < Formula
  desc 'octocov is a toolkit for collecting code metrics (code coverage, code to test ratio and test execution time).'
  version '0.74.0'
  license "MIT"
  homepage 'https://github.com/k1LoW/octocov'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.74.0/octocov_v0.74.0_darwin_arm64.zip'
      sha256 '413838f751c7ad6673da8dea10b993e50cf1d001b5648db000c51cd6881cea5d'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.74.0/octocov_v0.74.0_darwin_amd64.zip'
      sha256 '7e213707bd10d6af1269d0dffeb3cc8c861d30673eb5fa21036f39f9b8760a3f'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.74.0/octocov_v0.74.0_linux_amd64.tar.gz'
      sha256 '7a1ff834b85736fa26336186aa36c4ac54ab2855d60a3216032f0cd66cce5d29'
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
