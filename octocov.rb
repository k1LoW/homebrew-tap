class Octocov < Formula
  desc 'octocov is a toolkit for collecting code metrics (code coverage, code to test ratio and test execution time).'
  version '0.59.1'
  license "MIT"
  homepage 'https://github.com/k1LoW/octocov'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.59.1/octocov_v0.59.1_darwin_arm64.zip'
      sha256 '2f18caf4faa44c939dd1845e1efb106f9f6183621cbd61ebe5805db6fe55870a'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.59.1/octocov_v0.59.1_darwin_amd64.zip'
      sha256 '644b79b9b3e5df1a2834b9bae07551a1b2b53a451092d015f818488a7b888137'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.59.1/octocov_v0.59.1_linux_amd64.tar.gz'
      sha256 '8cd7e5846862fcaa4b332408b7846cf4aa94387eb15ea873ce4c1f212de703dd'
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
