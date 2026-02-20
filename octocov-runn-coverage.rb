class OctocovRunnCoverage < Formula
  desc 'Generate octocov custom metrics JSON from the output of 'runn coverage'.'
  version '0.1.4'
  homepage 'https://github.com/k1LoW/octocov-runn-coverage'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/octocov-runn-coverage/releases/download/v0.1.4/octocov-runn-coverage_v0.1.4_darwin_arm64.zip'
      sha256 '6849036950bca9a042f5ae38976d60d8570506b25e379bb3c21146c9eec83f6f'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov-runn-coverage/releases/download/v0.1.4/octocov-runn-coverage_v0.1.4_darwin_amd64.zip'
      sha256 '10a53bc0d9ec4a67fe1495b7eca1bb46683225249da0e58405019a40300b12e6'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/octocov-runn-coverage/releases/download/v0.1.4/octocov-runn-coverage_v0.1.4_linux_arm64.tar.gz'
      sha256 '7224368b18df26d32a81e17e9f09799df3d6988523d1f8e765132c247732e93b'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov-runn-coverage/releases/download/v0.1.4/octocov-runn-coverage_v0.1.4_linux_amd64.tar.gz'
      sha256 'b6e20cba6570ce23c6e7354c89ad48015d2d5380b061aa68378cc36c44008432'
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
