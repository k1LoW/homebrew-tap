class Octocov < Formula
  desc 'octocov is a toolkit for collecting code metrics (code coverage, code to test ratio and test execution time).'
  version '0.82.1'
  license "MIT"
  homepage 'https://github.com/k1LoW/octocov'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.82.1/octocov_v0.82.1_darwin_arm64.zip'
      sha256 '8bbc05c67dee479798e785b408aa22a4a658609f4e8c58ebdbe8ffa5a8af31e9'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.82.1/octocov_v0.82.1_darwin_amd64.zip'
      sha256 'f473d1a7690596ee14a8f0204d0511420758861098d011f82bb173f9990db651'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.82.1/octocov_v0.82.1_linux_amd64.tar.gz'
      sha256 'bf3588e95d51f4dca02589744c217aa0c7aa6251a14b54c71f6a03fd960403c6'
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
