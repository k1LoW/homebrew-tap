class Octocov < Formula
  desc 'octocov is a toolkit for collecting code metrics (code coverage, code to test ratio and test execution time).'
  version '0.70.0'
  license "MIT"
  homepage 'https://github.com/k1LoW/octocov'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.70.0/octocov_v0.70.0_darwin_arm64.zip'
      sha256 'e5ccdd3f692481d07ca7ae665fc8ff46f1d7fd436dac969dfee9a47f1e706f22'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.70.0/octocov_v0.70.0_darwin_amd64.zip'
      sha256 '6b6d6311128f46c1d3aa25d99e4e4457633443db9ca561de638bfcbab543b77b'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.70.0/octocov_v0.70.0_linux_amd64.tar.gz'
      sha256 '88562ea209f1533f51443f5840d508f9ec654115358e7939f7bf77d43314fe52'
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
