class Octocov < Formula
  desc 'octocov is a toolkit for collecting code metrics (code coverage, code to test ratio and test execution time).'
  version '0.52.2'
  license "MIT"
  homepage 'https://github.com/k1LoW/octocov'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.52.2/octocov_v0.52.2_darwin_arm64.zip'
      sha256 'd8531431be43e6bbd145fbffe74010181d0ab62e708bc2ac5113583148c4b342'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.52.2/octocov_v0.52.2_darwin_amd64.zip'
      sha256 'f44eb608c6e0fffcdf10700458507477d9d7bac5c8777115e548ad27934d5495'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.52.2/octocov_v0.52.2_linux_amd64.tar.gz'
      sha256 'bbfd7964c71fef5acd1a0a55cb72a79dcc52f8f6379415779b78b35ae4068dd5'
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
