class Octocov < Formula
  desc 'octocov is a toolkit for collecting code metrics (code coverage, code to test ratio and test execution time).'
  version '0.62.3'
  license "MIT"
  homepage 'https://github.com/k1LoW/octocov'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.62.3/octocov_v0.62.3_darwin_arm64.zip'
      sha256 '5a0e47db0ff69ed8bb3f03b4e2baa87767c5e6a198e879afad69e104a606f601'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.62.3/octocov_v0.62.3_darwin_amd64.zip'
      sha256 'c888cea53be4d125795d38781d39b0d6ed4ff9fa3680e9dee1381cba6739aa01'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.62.3/octocov_v0.62.3_linux_amd64.tar.gz'
      sha256 'd7764fc426bcf740043b205323102184a065cef098f45d249b9f715a90d9b99b'
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
