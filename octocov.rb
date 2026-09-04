class Octocov < Formula
  desc 'octocov is a toolkit for collecting code metrics (code coverage, code to test ratio and test execution time).'
  version '0.76.0'
  license "MIT"
  homepage 'https://github.com/k1LoW/octocov'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.76.0/octocov_v0.76.0_darwin_arm64.zip'
      sha256 'cb8214911fa7e0aed9e4e63f8fd7286f744f3f0b485242c01f2ac278b9698d94'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.76.0/octocov_v0.76.0_darwin_amd64.zip'
      sha256 '84f4e7722bfa898e83260c4aa90c7b62da7d0b18a09151e6cddda8d5814936aa'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.76.0/octocov_v0.76.0_linux_amd64.tar.gz'
      sha256 '7c27941649ee066452d0a07ee9f6d8c87f4511d2b2eff85f2e1b5be920d4d17a'
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
