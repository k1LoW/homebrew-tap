class OctocovRunnCoverage < Formula
  desc 'Generate octocov custom metrics JSON from the output of 'runn coverage'.'
  version '0.1.10'
  homepage 'https://github.com/k1LoW/octocov-runn-coverage'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/octocov-runn-coverage/releases/download/v0.1.10/octocov-runn-coverage_v0.1.10_darwin_arm64.zip'
      sha256 'b3cd0fc5ccf0ea007a27e79057748fb0b128cabccbc3dfa06e96f3b2f381c608'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov-runn-coverage/releases/download/v0.1.10/octocov-runn-coverage_v0.1.10_darwin_amd64.zip'
      sha256 '7ae2cee43e03de8bd44d3a537fe139fd0266543c33241a169631fd5cfa23fce1'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/octocov-runn-coverage/releases/download/v0.1.10/octocov-runn-coverage_v0.1.10_linux_arm64.tar.gz'
      sha256 '4ace081bbdedbe1bec31c243363119d8becd0544963c2c0042ced936582c9635'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov-runn-coverage/releases/download/v0.1.10/octocov-runn-coverage_v0.1.10_linux_amd64.tar.gz'
      sha256 '8f6d0293508e16262b1ad934e031ea74f24dc53939cc5f84174e539765f25f09'
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
