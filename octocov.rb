class Octocov < Formula
  desc 'octocov is a toolkit for collecting code metrics (code coverage, code to test ratio and test execution time).'
  version '0.80.1'
  license "MIT"
  homepage 'https://github.com/k1LoW/octocov'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.80.1/octocov_v0.80.1_darwin_arm64.zip'
      sha256 'e5e57a9aa5f92de6f820e3ad53abfff36cd585cdfba51253974d4b1eaabfee8f'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.80.1/octocov_v0.80.1_darwin_amd64.zip'
      sha256 '17b8b199709c9d043d039f54ca70c22f1d824224112aec6b891f75f76f6bd43a'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.80.1/octocov_v0.80.1_linux_amd64.tar.gz'
      sha256 '012c652747daef1631a3d2f5613ccb40347411b007049518f191d24c1d7bc850'
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
