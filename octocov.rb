class Octocov < Formula
  desc 'octocov is a toolkit for collecting code metrics (code coverage, code to test ratio and test execution time).'
  version '0.62.6'
  license "MIT"
  homepage 'https://github.com/k1LoW/octocov'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.62.6/octocov_v0.62.6_darwin_arm64.zip'
      sha256 '5bf9eb030f92d376d68a424f23bd34c616a3fd44372d2b2aa2a3f764921ee53f'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.62.6/octocov_v0.62.6_darwin_amd64.zip'
      sha256 '14678daeb38b4b3e68b4d3a8121503b11bedfbb0d701e9bdd70ef4377692acc6'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.62.6/octocov_v0.62.6_linux_amd64.tar.gz'
      sha256 'bf73a0bbed1775ba1091f9605f8fdfa4d2bb10d4ac7a56244abf08106392167d'
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
