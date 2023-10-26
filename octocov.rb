class Octocov < Formula
  desc 'octocov is a toolkit for collecting code metrics (code coverage, code to test ratio and test execution time).'
  version '0.54.5'
  license "MIT"
  homepage 'https://github.com/k1LoW/octocov'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.54.5/octocov_v0.54.5_darwin_arm64.zip'
      sha256 'a2b8c0aef65a5ec45a74287d05ebf1e7581ecd2f9d29f5eb0842d305985f0c52'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.54.5/octocov_v0.54.5_darwin_amd64.zip'
      sha256 '05bded9999c568824d11a3194fc77e45bde08839e9ec402032dd6e49250184eb'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.54.5/octocov_v0.54.5_linux_amd64.tar.gz'
      sha256 '1642bbfdbe31cf7bd960924e817e3879b473567c15aafed760b9eb161ebe58b6'
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
