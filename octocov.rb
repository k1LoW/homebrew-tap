class Octocov < Formula
  desc 'octocov is a toolkit for collecting code metrics (code coverage, code to test ratio and test execution time).'
  version '0.54.0'
  license "MIT"
  homepage 'https://github.com/k1LoW/octocov'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.54.0/octocov_v0.54.0_darwin_arm64.zip'
      sha256 '95652fedf0f67ea8e1f59fdcff5ecedeecab1681aa54b534ca2b709b0d6a856a'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.54.0/octocov_v0.54.0_darwin_amd64.zip'
      sha256 'd2666378fc1f1cc385cba6fd6fd14f0af9fdbb06a0d167bfcb4a8ccf3774ee38'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.54.0/octocov_v0.54.0_linux_amd64.tar.gz'
      sha256 'b5cdbd70126a6f4baa3baef017b4194df77b59974d7987c9f95e1b820c2f1e05'
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
