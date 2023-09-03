class Octocov < Formula
  desc 'octocov is a toolkit for collecting code metrics (code coverage, code to test ratio and test execution time).'
  version '0.51.2'
  license "MIT"
  homepage 'https://github.com/k1LoW/octocov'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.51.2/octocov_v0.51.2_darwin_arm64.zip'
      sha256 'be35764ca86a559912c5b07b5a8d1380d593d9644c2df34dda010c3222979349'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.51.2/octocov_v0.51.2_darwin_amd64.zip'
      sha256 '727b5578a3eedcf1a410a2af835eb971b553d30be9eb25819866764d0aa43f11'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.51.2/octocov_v0.51.2_linux_amd64.tar.gz'
      sha256 '6b1ba5454db9b65fbce93bc57afb691b5c6c3a952a35d52eadd79744ef07f030'
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
