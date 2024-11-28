class OctocovRunnCoverage < Formula
  desc 'Generate octocov custom metrics JSON from the output of 'runn coverage'.'
  version '0.0.5'
  homepage 'https://github.com/k1LoW/octocov-runn-coverage'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/octocov-runn-coverage/releases/download/v0.0.5/octocov-runn-coverage_v0.0.5_darwin_arm64.zip'
      sha256 'fbd7f10e7d9cf76f368dcb4857aefbc45f8c5c6841def95c2d9df97be4792d26'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov-runn-coverage/releases/download/v0.0.5/octocov-runn-coverage_v0.0.5_darwin_amd64.zip'
      sha256 '27f2aa751792dbaeda395568a9ca40f8177330b9226d5620e7ff8f80c05423b1'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/octocov-runn-coverage/releases/download/v0.0.5/octocov-runn-coverage_v0.0.5_linux_arm64.tar.gz'
      sha256 'd98298bb5a391fbc71452dd956fd8da051eca43c8613616d68860c544e798e69'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov-runn-coverage/releases/download/v0.0.5/octocov-runn-coverage_v0.0.5_linux_amd64.tar.gz'
      sha256 '11cf043ea46e523cc9c7af209a7d4d72bda9440221859f617a3b6bdb0f2761d5'
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
