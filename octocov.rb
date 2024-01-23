class Octocov < Formula
  desc 'octocov is a toolkit for collecting code metrics (code coverage, code to test ratio and test execution time).'
  version '0.56.2'
  license "MIT"
  homepage 'https://github.com/k1LoW/octocov'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.56.2/octocov_v0.56.2_darwin_arm64.zip'
      sha256 '60b4a0b87a51caac95cdf319ba221316a4193e468ca0abcdb242a1c4528974ee'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.56.2/octocov_v0.56.2_darwin_amd64.zip'
      sha256 'f9fafb5bdd29191a5028ed3e9829ead18ea2849fb32e37dc58eb27b69bfa9914'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.56.2/octocov_v0.56.2_linux_amd64.tar.gz'
      sha256 'a97a25bd99a04a5c8951c6339ddfd3d4de5e0adea5a54e34a5da95e4e8eb7e33'
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
