class Octocov < Formula
  desc 'octocov is a toolkit for collecting code metrics (code coverage, code to test ratio and test execution time).'
  version '0.83.0'
  license "MIT"
  homepage 'https://github.com/k1LoW/octocov'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.83.0/octocov_v0.83.0_darwin_arm64.zip'
      sha256 '668a3dbaa7e04dd2f2227d76250a42e1bc82712882caad4dc92df174fa1fb2f7'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.83.0/octocov_v0.83.0_darwin_amd64.zip'
      sha256 'a2720c483a43a0171afa897c09aef4069c07953b12134563537de77f687ca7cd'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.83.0/octocov_v0.83.0_linux_amd64.tar.gz'
      sha256 '53b56852dd9f8a9f9a534e2b814647d7e1629c5192344184a3cc3a1f26804b3b'
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
