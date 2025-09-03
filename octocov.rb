class Octocov < Formula
  desc 'octocov is a toolkit for collecting code metrics (code coverage, code to test ratio and test execution time).'
  version '0.71.2'
  license "MIT"
  homepage 'https://github.com/k1LoW/octocov'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.71.2/octocov_v0.71.2_darwin_arm64.zip'
      sha256 '91152b15b88dea1449a3d6e30f3f2e28d153513ef47d1949840dd27cfb292654'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.71.2/octocov_v0.71.2_darwin_amd64.zip'
      sha256 '6a7e084fc2212f5c67f60bd45b47d2439a6ce9710d05b55dc50e37334efa3a1d'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.71.2/octocov_v0.71.2_linux_amd64.tar.gz'
      sha256 'c33dfa013ff81ee77120312b437422d91e46624774f791d322fffb3e05297f00'
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
