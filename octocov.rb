class Octocov < Formula
  desc 'octocov is a toolkit for collecting code metrics (code coverage, code to test ratio and test execution time).'
  version '0.48.0'
  license "MIT"
  homepage 'https://github.com/k1LoW/octocov'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.48.0/octocov_v0.48.0_darwin_arm64.zip'
      sha256 'f8ca869527dc6d0cdfd283b1a504946dbf6ce7ce1997e7e16bba2e7ab24f3f0e'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.48.0/octocov_v0.48.0_darwin_amd64.zip'
      sha256 '46723001f49f3411d3748331792929d52ca65a6ca65a002bbf56647a748d0671'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.48.0/octocov_v0.48.0_linux_amd64.tar.gz'
      sha256 '48fac22709891d3487fb04c8cd7a7cf740bf8cada113da528197a577fc513cd5'
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
