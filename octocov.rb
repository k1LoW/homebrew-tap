class Octocov < Formula
  desc 'octocov is a toolkit for collecting code metrics (code coverage, code to test ratio and test execution time).'
  version '0.49.0'
  license "MIT"
  homepage 'https://github.com/k1LoW/octocov'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.49.0/octocov_v0.49.0_darwin_arm64.zip'
      sha256 '7393b8834bf20dac368e3b80ffcf1219d7d65f7ea72d2e18b2a11390ae0ed3b0'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.49.0/octocov_v0.49.0_darwin_amd64.zip'
      sha256 '1a0173617797cc0246a36ee4bde263b168cdd4575b99d74018c0eba666207e46'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.49.0/octocov_v0.49.0_linux_amd64.tar.gz'
      sha256 'ad6e915f5d5e4bc0701bc8de2f0e876ad4c7501c6b7dcc0f55562634b427c8f4'
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
