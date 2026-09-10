class Octocov < Formula
  desc 'octocov is a toolkit for collecting code metrics (code coverage, code to test ratio and test execution time).'
  version '0.78.0'
  license "MIT"
  homepage 'https://github.com/k1LoW/octocov'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.78.0/octocov_v0.78.0_darwin_arm64.zip'
      sha256 '35a72d95d7de77a548adf890e5a74b70e9765809c08a9dfb13792884e798d2b4'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.78.0/octocov_v0.78.0_darwin_amd64.zip'
      sha256 '81827bb8ceee4b4cb76122a8610bfc16a952f8aa34dcafe9db47ab5aabe77874'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.78.0/octocov_v0.78.0_linux_amd64.tar.gz'
      sha256 '50ce368198ae9fe4ed08a0ba676b6cc79d80678a8f436499d7b252c97ee7f328'
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
