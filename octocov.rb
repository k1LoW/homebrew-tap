class Octocov < Formula
  desc 'octocov is a toolkit for collecting code metrics (code coverage, code to test ratio and test execution time).'
  version '0.69.0'
  license "MIT"
  homepage 'https://github.com/k1LoW/octocov'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.69.0/octocov_v0.69.0_darwin_arm64.zip'
      sha256 '1cb9b9871dfafd1df8108fe02f1f546e2b41511edb90734ea32e5dd23c53dc4d'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.69.0/octocov_v0.69.0_darwin_amd64.zip'
      sha256 '2814f44b8f86c9b73522dc44d0079ab97a4ce1af4c9732d1c31cfee5ff84d0d2'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.69.0/octocov_v0.69.0_linux_amd64.tar.gz'
      sha256 'e69982fd813373eaa9e41e9be238fc5eec5da2a792dc610128ab28d4098ebea5'
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
