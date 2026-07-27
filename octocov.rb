class Octocov < Formula
  desc 'octocov is a toolkit for collecting code metrics (code coverage, code to test ratio and test execution time).'
  version '0.75.11'
  license "MIT"
  homepage 'https://github.com/k1LoW/octocov'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.75.11/octocov_v0.75.11_darwin_arm64.zip'
      sha256 'ee9c7aa37e42f74d61c7b877593768da026879b45b8d9cefb08bb030b5dabacb'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.75.11/octocov_v0.75.11_darwin_amd64.zip'
      sha256 '9058a036b18ff49336e27bf91037c6630c6fbac9ae316249c4d44fbe4d14b753'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.75.11/octocov_v0.75.11_linux_amd64.tar.gz'
      sha256 'cd0a3a2514365b71283c6a6e56032de8f8673194c170c7f23f009ecf4ceb423d'
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
