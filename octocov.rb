class Octocov < Formula
  desc 'octocov is a toolkit for collecting code metrics (code coverage, code to test ratio and test execution time).'
  version '0.51.4'
  license "MIT"
  homepage 'https://github.com/k1LoW/octocov'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.51.4/octocov_v0.51.4_darwin_arm64.zip'
      sha256 '599bfa61ecdb22bef5da5558c2cebb40954e7e5d9575f0502b840d0d221c4bea'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.51.4/octocov_v0.51.4_darwin_amd64.zip'
      sha256 '9190c29eae886ea0ea3617012aceb83632048d6974180080f706aec2e0435c12'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.51.4/octocov_v0.51.4_linux_amd64.tar.gz'
      sha256 'cc17f80a598930b43ea9cc00d8c2103f7ef8ed72a6b165ee60efd5c2f9d3dd66'
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
