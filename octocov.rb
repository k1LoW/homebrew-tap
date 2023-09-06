class Octocov < Formula
  desc 'octocov is a toolkit for collecting code metrics (code coverage, code to test ratio and test execution time).'
  version '0.51.6'
  license "MIT"
  homepage 'https://github.com/k1LoW/octocov'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.51.6/octocov_v0.51.6_darwin_arm64.zip'
      sha256 '387cf17dbbd10554509bf72df0ddd15ae15d09f18b58f5ddb42f3e22ad24b8cc'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.51.6/octocov_v0.51.6_darwin_amd64.zip'
      sha256 '6c2ef5f988eab20ff20a7c0be3febbd5e29f327abb469ff60a4f678f3c0cdfe8'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.51.6/octocov_v0.51.6_linux_amd64.tar.gz'
      sha256 '94b550f4bbb9205af643caeabefc435bbece25e95100f268e7d1b4a3d1b97bd8'
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
