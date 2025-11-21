class OctocovRunnCoverage < Formula
  desc 'Generate octocov custom metrics JSON from the output of 'runn coverage'.'
  version '0.1.2'
  homepage 'https://github.com/k1LoW/octocov-runn-coverage'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/octocov-runn-coverage/releases/download/v0.1.2/octocov-runn-coverage_v0.1.2_darwin_arm64.zip'
      sha256 'cd120c9cb341192c6600ddfaafc99765dfe1d1a60d4cbfd50cae2fec3a70d1ce'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov-runn-coverage/releases/download/v0.1.2/octocov-runn-coverage_v0.1.2_darwin_amd64.zip'
      sha256 'f3589c5a1cc3dc1db6f0589de6f6010e7ce96fbc0f1ad153d4a869824f6fc9ad'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/octocov-runn-coverage/releases/download/v0.1.2/octocov-runn-coverage_v0.1.2_linux_arm64.tar.gz'
      sha256 '78df738fe732232bb8ac7c46ae8b4108979e992407cc5215f04f9318721e6073'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov-runn-coverage/releases/download/v0.1.2/octocov-runn-coverage_v0.1.2_linux_amd64.tar.gz'
      sha256 '546af82af7f4b52422604ad831c78b40b353520310739c249684393487673669'
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
