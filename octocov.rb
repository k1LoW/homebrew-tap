class Octocov < Formula
  desc 'octocov is a toolkit for collecting code metrics (code coverage, code to test ratio and test execution time).'
  version '0.75.5'
  license "MIT"
  homepage 'https://github.com/k1LoW/octocov'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.75.5/octocov_v0.75.5_darwin_arm64.zip'
      sha256 'dd3eb6d037db660d2ff4a90fd88b75a058d5ce1edb449e0d923c90543d4851a6'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.75.5/octocov_v0.75.5_darwin_amd64.zip'
      sha256 'a1a52e7176e438e0d3a30f1e3921ed01dcecc91b6b4ca37c70d5ce1b125148d9'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.75.5/octocov_v0.75.5_linux_amd64.tar.gz'
      sha256 'f46e0bab91f1ef86b2ae55c56173920ce5bb98515a8e4ddbb2da9469bdba27a4'
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
