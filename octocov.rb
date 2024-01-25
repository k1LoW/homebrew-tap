class Octocov < Formula
  desc 'octocov is a toolkit for collecting code metrics (code coverage, code to test ratio and test execution time).'
  version '0.56.4'
  license "MIT"
  homepage 'https://github.com/k1LoW/octocov'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.56.4/octocov_v0.56.4_darwin_arm64.zip'
      sha256 'a296f30c172e8f18b61f58213ed993d8ecc09a7f210aa028bb75ca77ce0d9007'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.56.4/octocov_v0.56.4_darwin_amd64.zip'
      sha256 'dfad1b3a89c451cd136af42776e34be44d667de17eb9b809020c67383011bfba'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.56.4/octocov_v0.56.4_linux_amd64.tar.gz'
      sha256 '180083a1b655a17fd9adf7d1e41fe1e6ebccc1e00f2c41e10976b0c587b42973'
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
