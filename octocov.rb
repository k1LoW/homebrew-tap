class Octocov < Formula
  desc 'octocov is a toolkit for collecting code metrics (code coverage, code to test ratio and test execution time).'
  version '0.74.3'
  license "MIT"
  homepage 'https://github.com/k1LoW/octocov'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.74.3/octocov_v0.74.3_darwin_arm64.zip'
      sha256 'cc914c59bdf5271c2319abf1b77b3743905f8cf686054d992b71fe66e202cb75'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.74.3/octocov_v0.74.3_darwin_amd64.zip'
      sha256 '91b107c056d9650aaa83377fab10b8201ad728e17425c7edf07dcbd2be619986'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.74.3/octocov_v0.74.3_linux_amd64.tar.gz'
      sha256 '510dd447f58f268043a1d6c9d73af89d3b7391f26a865c859b4389cfa9482d12'
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
