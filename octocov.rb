class Octocov < Formula
  desc 'octocov is a toolkit for collecting code metrics (code coverage, code to test ratio and test execution time).'
  version '0.80.0'
  license "MIT"
  homepage 'https://github.com/k1LoW/octocov'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.80.0/octocov_v0.80.0_darwin_arm64.zip'
      sha256 '13b2d6f06e828a1c04ae94b64f9bb4ac9a7a33053b672e454b5562ff4729f6e7'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.80.0/octocov_v0.80.0_darwin_amd64.zip'
      sha256 '69436d1c94fd65503c31fc1e08d96df09b2d0d8bcb6cdf4b311c71fd907d8c24'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.80.0/octocov_v0.80.0_linux_amd64.tar.gz'
      sha256 'aaa7c95af41a303407ec248a73a6cf9d0c0e8843c14e30f215aac06c7e402b95'
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
