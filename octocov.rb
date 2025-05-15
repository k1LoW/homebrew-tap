class Octocov < Formula
  desc 'octocov is a toolkit for collecting code metrics (code coverage, code to test ratio and test execution time).'
  version '0.67.1'
  license "MIT"
  homepage 'https://github.com/k1LoW/octocov'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.67.1/octocov_v0.67.1_darwin_arm64.zip'
      sha256 'f7d873f8ae38167d42755a4735b4df94403de5aaf0325f8a27bec33807c15edf'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.67.1/octocov_v0.67.1_darwin_amd64.zip'
      sha256 'd0bb4e854690599aed9ed2e9d56026783421390addb4f714f9632bd0b028af42'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.67.1/octocov_v0.67.1_linux_amd64.tar.gz'
      sha256 '053bebca4326f340719b4d987a066e55f2c7509c28844a77617692db845aee24'
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
