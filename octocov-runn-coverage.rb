class OctocovRunnCoverage < Formula
  desc 'Generate octocov custom metrics JSON from the output of 'runn coverage'.'
  version '0.1.6'
  homepage 'https://github.com/k1LoW/octocov-runn-coverage'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/octocov-runn-coverage/releases/download/v0.1.6/octocov-runn-coverage_v0.1.6_darwin_arm64.zip'
      sha256 '151709a7e1028d8f0b0119ab2233f3606e75701db012b8ab835c1a3a077942e5'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov-runn-coverage/releases/download/v0.1.6/octocov-runn-coverage_v0.1.6_darwin_amd64.zip'
      sha256 '94fa84eb7ca876f98a778806bc85933a416e0a195861190829b68f2e06d82090'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/octocov-runn-coverage/releases/download/v0.1.6/octocov-runn-coverage_v0.1.6_linux_arm64.tar.gz'
      sha256 '47addaf19f3e87746a6e850a8c58585d844517a1fccbb26404f69fc8ee257a2e'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov-runn-coverage/releases/download/v0.1.6/octocov-runn-coverage_v0.1.6_linux_amd64.tar.gz'
      sha256 '1576fa4ca3c5755c346f767642ffe4f5a81ef1930c9deb1001d27bce2c2bda63'
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
