class Octocov < Formula
  desc 'octocov is a toolkit for collecting code metrics (code coverage, code to test ratio and test execution time).'
  version '0.83.1'
  license "MIT"
  homepage 'https://github.com/k1LoW/octocov'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.83.1/octocov_v0.83.1_darwin_arm64.zip'
      sha256 '46ad5d66a8101aa3d6c1577ea2bee99a8b69fd750f9d2ba6036a182fe85fc876'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.83.1/octocov_v0.83.1_darwin_amd64.zip'
      sha256 '5a71977d48de6d4b2a2763e4ff6f03fa5fb4b09035f945c1808c40a8bb9f56a3'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.83.1/octocov_v0.83.1_linux_amd64.tar.gz'
      sha256 '8e9980e02a2713d0335d9928761b2bfa111c6f9ff879252dc2b11e0bd712e332'
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
