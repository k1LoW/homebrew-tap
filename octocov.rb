class Octocov < Formula
  desc 'octocov is a toolkit for collecting code metrics (code coverage, code to test ratio and test execution time).'
  version '0.56.3'
  license "MIT"
  homepage 'https://github.com/k1LoW/octocov'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.56.3/octocov_v0.56.3_darwin_arm64.zip'
      sha256 '23e04a6e2620006bca73ef15605c4d12b1974255a1946e3a5d3c956bb35db854'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.56.3/octocov_v0.56.3_darwin_amd64.zip'
      sha256 '38a5b7bda44df22961462bca945de9a44e061650869f5b96f66d27a37771b268'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.56.3/octocov_v0.56.3_linux_amd64.tar.gz'
      sha256 '0a2101592245c6ad66c33a535edd2f92c703f418cf2454a475221f8873917f8d'
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
