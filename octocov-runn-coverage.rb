class OctocovRunnCoverage < Formula
  desc 'Generate octocov custom metrics JSON from the output of 'runn coverage'.'
  version '0.0.1'
  homepage 'https://github.com/k1LoW/octocov-runn-coverage'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/octocov-runn-coverage/releases/download/v0.0.1/octocov-runn-coverage_v0.0.1_darwin_arm64.zip'
      sha256 '03f1f45a31290dede39a479e03b29025be9fa5c17950b19c560b31549a0c076a'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov-runn-coverage/releases/download/v0.0.1/octocov-runn-coverage_v0.0.1_darwin_amd64.zip'
      sha256 'fb0735ce7e7f3681775d0b564e43110406d777109695d61edb5c58040984d9e8'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/octocov-runn-coverage/releases/download/v0.0.1/octocov-runn-coverage_v0.0.1_linux_arm64.tar.gz'
      sha256 '062bc8390e801bbe149a37eb4bd1ce4b11f4aa2dc6ed3dae8b2ba0aa7d5e8445'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov-runn-coverage/releases/download/v0.0.1/octocov-runn-coverage_v0.0.1_linux_amd64.tar.gz'
      sha256 'ccc2cfedc9c7d73066d83e72f53ed0961e1c97c289d59d989cc28d84fbb1992f'
    end
  end

  head do
    url 'https://github.com/k1LoW/octocov-runn-coverage.git'
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    bin.install 'octocov-runn-coverage'
  end
end
