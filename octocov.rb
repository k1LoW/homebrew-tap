class Octocov < Formula
  desc 'octocov is a toolkit for collecting code metrics (code coverage, code to test ratio and test execution time).'
  version '0.65.0'
  license "MIT"
  homepage 'https://github.com/k1LoW/octocov'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.65.0/octocov_v0.65.0_darwin_arm64.zip'
      sha256 'bd6788a8effe5b0facbb98506142a6bec8c6c15a4146f5b8ed332c8864c4dbcd'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.65.0/octocov_v0.65.0_darwin_amd64.zip'
      sha256 '6cbc92e940f203a13b002f5b48fe85ccee46aa8aabf4663b7733c23050a39b6d'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.65.0/octocov_v0.65.0_linux_amd64.tar.gz'
      sha256 '4118f3b39cb5e4528421cc0191dcbe8a38039e1ca53b00144a6a99aa81c0aa14'
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
