class Octocov < Formula
  desc 'octocov is a toolkit for collecting code metrics (code coverage, code to test ratio and test execution time).'
  version '0.67.2'
  license "MIT"
  homepage 'https://github.com/k1LoW/octocov'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.67.2/octocov_v0.67.2_darwin_arm64.zip'
      sha256 '4cd1c1cc8fba2b9caa7e62378a26c09fa7f7f0201b506cec294c32816c15c4e2'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.67.2/octocov_v0.67.2_darwin_amd64.zip'
      sha256 '269592476a4bb59a22478e2ed7d9fbf18d2a39a6588e36ccbb39fec65259f05a'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.67.2/octocov_v0.67.2_linux_amd64.tar.gz'
      sha256 '5677edcf3b43c17ec81bdf2164b8f56cae88d28d6e308a079d30eba564a7f837'
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
