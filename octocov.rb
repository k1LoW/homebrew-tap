class Octocov < Formula
  desc 'octocov is a toolkit for collecting code metrics (code coverage, code to test ratio and test execution time).'
  version '0.62.2'
  license "MIT"
  homepage 'https://github.com/k1LoW/octocov'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.62.2/octocov_v0.62.2_darwin_arm64.zip'
      sha256 '7caf326d712a26596189d12d1f12d9f475747f25305235a2d0f4a94a6b194855'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.62.2/octocov_v0.62.2_darwin_amd64.zip'
      sha256 'f1a360169a942eabf9aeb285a8d93a21eea678d995fb6e7d22837471d3373b90'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.62.2/octocov_v0.62.2_linux_amd64.tar.gz'
      sha256 '001dababad2b0cebad83208b09e692f410aed1d14a5345b40a13d736e017fa93'
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
