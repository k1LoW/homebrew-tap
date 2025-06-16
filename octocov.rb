class Octocov < Formula
  desc 'octocov is a toolkit for collecting code metrics (code coverage, code to test ratio and test execution time).'
  version '0.68.1'
  license "MIT"
  homepage 'https://github.com/k1LoW/octocov'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.68.1/octocov_v0.68.1_darwin_arm64.zip'
      sha256 '0cb9b1b7d61e822710733f9004414ab88d8498b35ccf30de17d7c54a6984fca7'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.68.1/octocov_v0.68.1_darwin_amd64.zip'
      sha256 '8c6bc055dc96e672884eb7b70ddc583b5c4ca9318ce7f28d81f153441afdd360'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.68.1/octocov_v0.68.1_linux_amd64.tar.gz'
      sha256 '42025004ee7ab72a82ba155e2e90490da0275628084acaafd3afb4ba4e832096'
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
