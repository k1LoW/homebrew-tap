class Octocov < Formula
  desc 'octocov is a toolkit for collecting code metrics (code coverage, code to test ratio and test execution time).'
  version '0.83.3'
  license "MIT"
  homepage 'https://github.com/k1LoW/octocov'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.83.3/octocov_v0.83.3_darwin_arm64.zip'
      sha256 '8a6537a6c9d0ffcbe1d629e8d0d357c23722b8fb3d5d4b98e074334214db1f80'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.83.3/octocov_v0.83.3_darwin_amd64.zip'
      sha256 '330b26c6100ded48fa0d8142b7aa479c96d85df725fce759abf088ec9ab4cfab'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.83.3/octocov_v0.83.3_linux_amd64.tar.gz'
      sha256 '8d6576580d151e785474f193d740f63cb91b70ac767d402410fcd7f187a34202'
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
