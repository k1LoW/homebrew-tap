class Octocov < Formula
  desc 'octocov is a toolkit for collecting code metrics (code coverage, code to test ratio and test execution time).'
  version '0.71.3'
  license "MIT"
  homepage 'https://github.com/k1LoW/octocov'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.71.3/octocov_v0.71.3_darwin_arm64.zip'
      sha256 '299a933f8ffaba3e3f061371b519c23d0503598b008d640c3241316025c649a1'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.71.3/octocov_v0.71.3_darwin_amd64.zip'
      sha256 '11c562e7a1abd7be97c38bf3642b882f4fa59323733339bfb1252765868954c2'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.71.3/octocov_v0.71.3_linux_amd64.tar.gz'
      sha256 '45a6d362cc7759d3a206e95a1efe72c53fabbb38250b9a157f789e30a9d65ced'
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
