class Octocov < Formula
  desc 'octocov is a toolkit for collecting code metrics (code coverage, code to test ratio and test execution time).'
  version '0.65.2'
  license "MIT"
  homepage 'https://github.com/k1LoW/octocov'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.65.2/octocov_v0.65.2_darwin_arm64.zip'
      sha256 'a60660570d25b1fc6418be5d3ce285f1f6148bb4dbfbc1a5d7734399891a932f'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.65.2/octocov_v0.65.2_darwin_amd64.zip'
      sha256 'f2608dc77f3bfbf1e971a19a1d3a0c69ad9d8a25a9c512440773c808902df3e2'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.65.2/octocov_v0.65.2_linux_amd64.tar.gz'
      sha256 '69943d922e38897a6b4b4e409feb99beac5466d132f31eb1c6a61c9b4d00bcaa'
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
