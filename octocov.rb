class Octocov < Formula
  desc 'octocov is a toolkit for collecting code metrics (code coverage, code to test ratio and test execution time).'
  version '0.62.5'
  license "MIT"
  homepage 'https://github.com/k1LoW/octocov'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.62.5/octocov_v0.62.5_darwin_arm64.zip'
      sha256 '6e9f65dc6146d9d251ed92bebbefd105f8e34301a39711a33af3930744971100'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.62.5/octocov_v0.62.5_darwin_amd64.zip'
      sha256 '9e7d067c17eb2cc3ee1cc7e25e53feb89cc2d703bc9680df268907fe0407c2e6'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.62.5/octocov_v0.62.5_linux_amd64.tar.gz'
      sha256 '2437d00862e06e3064ff6fa62ebdfe96eebd96976cdeda6b7a8df57dc4e436c6'
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
