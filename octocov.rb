class Octocov < Formula
  desc 'octocov is a toolkit for collecting code metrics (code coverage, code to test ratio and test execution time).'
  version '0.83.4'
  license "MIT"
  homepage 'https://github.com/k1LoW/octocov'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.83.4/octocov_v0.83.4_darwin_arm64.zip'
      sha256 '7dc191effd1b1e4e8cc85abba95197f8af813deadd7e1b04981e3866d0026701'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.83.4/octocov_v0.83.4_darwin_amd64.zip'
      sha256 'c279359b963ef24a21915bbce8d0af035e4ae317bb31d55990c4b1cab5f5995f'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.83.4/octocov_v0.83.4_linux_amd64.tar.gz'
      sha256 '238ea9ab3d3fa089448b18ee6d5d84f74f785fd03be4c8761e2fb455372b86f1'
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
