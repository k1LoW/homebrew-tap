class Octocov < Formula
  desc 'octocov is a toolkit for collecting code metrics (code coverage, code to test ratio and test execution time).'
  version '0.62.1'
  license "MIT"
  homepage 'https://github.com/k1LoW/octocov'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.62.1/octocov_v0.62.1_darwin_arm64.zip'
      sha256 'd42ceb503989fa5bc329986c70f20728ed6e26ba3510be10c832c7ef8a313684'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.62.1/octocov_v0.62.1_darwin_amd64.zip'
      sha256 '53e5ce521226d17f2a4df7641e4c009d45ef6a748394eab13e24345d3afc9d2f'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.62.1/octocov_v0.62.1_linux_amd64.tar.gz'
      sha256 '26d9a94ad6a4fe140ffda535f1f09797f056c650f35e77561967372108ec67c7'
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
