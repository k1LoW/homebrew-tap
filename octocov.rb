class Octocov < Formula
  desc 'octocov is a toolkit for collecting code metrics (code coverage, code to test ratio and test execution time).'
  version '0.58.1'
  license "MIT"
  homepage 'https://github.com/k1LoW/octocov'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.58.1/octocov_v0.58.1_darwin_arm64.zip'
      sha256 '0006a14d16cb10d2a3ddf99a2864b37159fe9057a604f7c9cf1303354c6241ad'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.58.1/octocov_v0.58.1_darwin_amd64.zip'
      sha256 '91e2b0dd775c6bff3d1d15e73945e8f5f4ecc4310ac3dd24a4687911d312a84d'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.58.1/octocov_v0.58.1_linux_amd64.tar.gz'
      sha256 'ea77ae4248951309b11943e6fc68165f5d0beab5fa89878e66ac3cdacd6f367e'
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
