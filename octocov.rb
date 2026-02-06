class Octocov < Formula
  desc 'octocov is a toolkit for collecting code metrics (code coverage, code to test ratio and test execution time).'
  version '0.74.4'
  license "MIT"
  homepage 'https://github.com/k1LoW/octocov'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.74.4/octocov_v0.74.4_darwin_arm64.zip'
      sha256 '70bd8c31f4bf0ff2c4dd1976241db9ea86c7aa74631e057a33b7e3c53a1f9521'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.74.4/octocov_v0.74.4_darwin_amd64.zip'
      sha256 '32c71ecc9a3fd401a4479ca55c73c02f0f9f7f2b6b4be059a5ead33465ae66d9'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.74.4/octocov_v0.74.4_linux_amd64.tar.gz'
      sha256 '958503f7a6e25c140c962d2bc663b212018fc4eed742cb939d976fead8343341'
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
