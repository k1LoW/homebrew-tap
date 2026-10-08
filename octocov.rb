class Octocov < Formula
  desc 'octocov is a toolkit for collecting code metrics (code coverage, code to test ratio and test execution time).'
  version '0.83.2'
  license "MIT"
  homepage 'https://github.com/k1LoW/octocov'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.83.2/octocov_v0.83.2_darwin_arm64.zip'
      sha256 'bc403576fbba700aa0223c49252ad8a2ad49993b974036d727f09bae26261995'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.83.2/octocov_v0.83.2_darwin_amd64.zip'
      sha256 'aabb06f6d8ea9b8f5b5af1d7acda6033d2fbabd2d6810cd41ae33cf30421a5f7'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.83.2/octocov_v0.83.2_linux_amd64.tar.gz'
      sha256 'e8b0d48837ad56d35eec22a2f0f9e0bc7cbe0fc9ec4a8575bae7e4d52dd6f3d5'
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
