class OctocovRunnCoverage < Formula
  desc 'Generate octocov custom metrics JSON from the output of 'runn coverage'.'
  version '0.1.3'
  homepage 'https://github.com/k1LoW/octocov-runn-coverage'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/octocov-runn-coverage/releases/download/v0.1.3/octocov-runn-coverage_v0.1.3_darwin_arm64.zip'
      sha256 'b875d3f4eb8e706ace763e27b4cdbc4d1a167b727a8badebcb47a011ecff5b06'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov-runn-coverage/releases/download/v0.1.3/octocov-runn-coverage_v0.1.3_darwin_amd64.zip'
      sha256 '323331c4bc333e29b38e8446b27113cf13793bc5db0fa705d58a5c66a5aa6403'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/octocov-runn-coverage/releases/download/v0.1.3/octocov-runn-coverage_v0.1.3_linux_arm64.tar.gz'
      sha256 'd7de107ad12c654dda432d60fd80fbccd7b846c5d9bde66551921fd4eadec1d5'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov-runn-coverage/releases/download/v0.1.3/octocov-runn-coverage_v0.1.3_linux_amd64.tar.gz'
      sha256 'acb04435b1156f1ba6238aab45b0cbba8366678584b65d8961e0ad9bdc15d3ea'
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
