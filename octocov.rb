class Octocov < Formula
  desc 'octocov is a toolkit for collecting code metrics (code coverage, code to test ratio and test execution time).'
  version '0.73.1'
  license "MIT"
  homepage 'https://github.com/k1LoW/octocov'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.73.1/octocov_v0.73.1_darwin_arm64.zip'
      sha256 'bba678420888dab4687360f4b8dcd22d66926ba272b6a8d43e3b2e03f47be8ed'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.73.1/octocov_v0.73.1_darwin_amd64.zip'
      sha256 '225c00ed9992666e3c96f8dfc8a9b8575ec7990dc7251cc4f223a670426a2608'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.73.1/octocov_v0.73.1_linux_amd64.tar.gz'
      sha256 'fa15f43e7c0ace63f3b0107a284af1d81b6ad47ac6909a7ba8f6bb8135ca7e7f'
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
