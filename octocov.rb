class Octocov < Formula
  desc 'octocov is a toolkit for collecting code metrics (code coverage, code to test ratio and test execution time).'
  version '0.61.0'
  license "MIT"
  homepage 'https://github.com/k1LoW/octocov'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.61.0/octocov_v0.61.0_darwin_arm64.zip'
      sha256 'c425e8e6796b87d6d1deb99f97948ed860361cc42d5872c124cb338cceaebd73'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.61.0/octocov_v0.61.0_darwin_amd64.zip'
      sha256 '1bd8da368183f133abb8b79982f328f167d8d0ee67f06d3c756196f3d36f2577'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.61.0/octocov_v0.61.0_linux_amd64.tar.gz'
      sha256 '4a434f16199367f053cc9170cf34c36318066e90bf92fde8f696a70b007d32cb'
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
