class Octocov < Formula
  desc 'octocov is a toolkit for collecting code metrics (code coverage, code to test ratio and test execution time).'
  version '0.64.0'
  license "MIT"
  homepage 'https://github.com/k1LoW/octocov'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.64.0/octocov_v0.64.0_darwin_arm64.zip'
      sha256 '3940cbac0ed1038be44a2a82dae33192cdb088255a6198afc44c8fecb676af58'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.64.0/octocov_v0.64.0_darwin_amd64.zip'
      sha256 'a9a8fd60abc2faf9ccfcaa2bba6cf8b3c355650d0a48e02fcca5d0d57337a72f'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.64.0/octocov_v0.64.0_linux_amd64.tar.gz'
      sha256 'c49cdc513ce0aee4f0d05e9e2c40af6543935a9939904a5f6d193ab5ee1bc9f5'
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
