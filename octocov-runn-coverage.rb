class OctocovRunnCoverage < Formula
  desc 'Generate octocov custom metrics JSON from the output of 'runn coverage'.'
  version '0.1.11'
  homepage 'https://github.com/k1LoW/octocov-runn-coverage'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/octocov-runn-coverage/releases/download/v0.1.11/octocov-runn-coverage_v0.1.11_darwin_arm64.zip'
      sha256 '39ce8f8a6514f5e22dc7a6af68a3db4e623b352cc6b6d0b04f31592719f97bff'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov-runn-coverage/releases/download/v0.1.11/octocov-runn-coverage_v0.1.11_darwin_amd64.zip'
      sha256 'dd33de5904710a8853cdb323aae1773cd22e93c96cd567bd26635410b557aed3'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/octocov-runn-coverage/releases/download/v0.1.11/octocov-runn-coverage_v0.1.11_linux_arm64.tar.gz'
      sha256 'eb8a5a89892d517df87e8c075f4300117bf419b3c2f284c1e1030d432b70dd40'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov-runn-coverage/releases/download/v0.1.11/octocov-runn-coverage_v0.1.11_linux_amd64.tar.gz'
      sha256 '276da6b0893dcdcc937400091855bae67a08e1d82efc5781fbb6f1c8f046fd57'
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
