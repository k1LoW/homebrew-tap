class Octocov < Formula
  desc 'octocov is a toolkit for collecting code metrics (code coverage, code to test ratio and test execution time).'
  version '0.60.0'
  license "MIT"
  homepage 'https://github.com/k1LoW/octocov'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.60.0/octocov_v0.60.0_darwin_arm64.zip'
      sha256 '2a254686af41938757eb02675fda2a39dd6d82a33a5e0b2280df0ce418a9955a'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.60.0/octocov_v0.60.0_darwin_amd64.zip'
      sha256 '8c43a76b8266825677e28682226706f885c0cfaad43cf518451c872327953660'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.60.0/octocov_v0.60.0_linux_amd64.tar.gz'
      sha256 '67ff7b3e96d92d2bdde0e3be95704763d20c33c8d536ce1181f713aedd6c8060'
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
