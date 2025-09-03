class Octocov < Formula
  desc 'octocov is a toolkit for collecting code metrics (code coverage, code to test ratio and test execution time).'
  version '0.71.1'
  license "MIT"
  homepage 'https://github.com/k1LoW/octocov'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.71.1/octocov_v0.71.1_darwin_arm64.zip'
      sha256 '026c6b4cf7f1c141d858b3a191216712eb05e7094826592c4006123324d19080'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.71.1/octocov_v0.71.1_darwin_amd64.zip'
      sha256 'a81a8e98258ffd8bba884c2414bd90865a6e8e4d5908e862dcee2bdc9eba93d5'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.71.1/octocov_v0.71.1_linux_amd64.tar.gz'
      sha256 'dd98cbb06cf14f18864cb7502f0e1a9fa0f1a16c2f8c82bb9e532ec50976c2c7'
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
