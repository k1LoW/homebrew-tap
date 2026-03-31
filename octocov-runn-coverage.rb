class OctocovRunnCoverage < Formula
  desc 'Generate octocov custom metrics JSON from the output of 'runn coverage'.'
  version '0.1.8'
  homepage 'https://github.com/k1LoW/octocov-runn-coverage'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/octocov-runn-coverage/releases/download/v0.1.8/octocov-runn-coverage_v0.1.8_darwin_arm64.zip'
      sha256 'b408786b21b27c76cabec0f1bbe86de672701d74969515601864eeafd3f85fe8'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov-runn-coverage/releases/download/v0.1.8/octocov-runn-coverage_v0.1.8_darwin_amd64.zip'
      sha256 '1f74fbcffd840386284ca4ea70de1a5aa132107af8bb46b82f1575d513b10f49'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/octocov-runn-coverage/releases/download/v0.1.8/octocov-runn-coverage_v0.1.8_linux_arm64.tar.gz'
      sha256 'cf4e21f8b4aa7e79f858df699dd9bf8bb3f626940e43a2684500802132eec52d'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov-runn-coverage/releases/download/v0.1.8/octocov-runn-coverage_v0.1.8_linux_amd64.tar.gz'
      sha256 '1a1afdf5cc9ffe24b02aefc0cf0027287f9c00f4fa1523dd1ab406f2189b81b3'
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
