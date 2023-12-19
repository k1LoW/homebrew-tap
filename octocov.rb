class Octocov < Formula
  desc 'octocov is a toolkit for collecting code metrics (code coverage, code to test ratio and test execution time).'
  version '0.55.1'
  license "MIT"
  homepage 'https://github.com/k1LoW/octocov'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.55.1/octocov_v0.55.1_darwin_arm64.zip'
      sha256 'b3a792f6cef744361fafbd8116e47e0bf8d8fa95adce32cf96ddc30f7ecec0f1'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.55.1/octocov_v0.55.1_darwin_amd64.zip'
      sha256 '7d7873f708e23f14da15301383a9cae5d24105f3593a72d7271723f72d98e0b1'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.55.1/octocov_v0.55.1_linux_amd64.tar.gz'
      sha256 '3c9efcedb4e07ab79327995194b90a0d0e1e6712ccc8efd1b4705ccfa9560d5c'
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
