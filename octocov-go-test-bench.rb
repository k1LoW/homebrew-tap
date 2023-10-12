class OctocovGoTestBench < Formula
  desc 'Generate custom metrics JSON from the output of `go test -bench`.'
  version '1.3.1'
  homepage 'https://github.com/k1LoW/octocov-go-test-bench'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/octocov-go-test-bench/releases/download/v1.3.1/octocov-go-test-bench_v1.3.1_darwin_arm64.zip'
      sha256 '65089eef77c008580244162531d292c88b1ec9013cc4baa683631b4607448b82'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov-go-test-bench/releases/download/v1.3.1/octocov-go-test-bench_v1.3.1_darwin_amd64.zip'
      sha256 '8a064aaee5ab58e5cd8d143d8614b1a32329743ecb448e48438b024bed9d27e5'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/octocov-go-test-bench/releases/download/v1.3.1/octocov-go-test-bench_v1.3.1_linux_arm64.tar.gz'
      sha256 '9db649b9c7ed9692a45cc4ae8d89b5d3485de65cfe38887862ace565b406c60f'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov-go-test-bench/releases/download/v1.3.1/octocov-go-test-bench_v1.3.1_linux_amd64.tar.gz'
      sha256 '80eb15b2fe82e7f9cc38ab30254ab82f2d4941c801a1892305323b3dba635737'
    end
  end

  head do
    url 'https://github.com/k1LoW/octocov-go-test-bench.git'
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    bin.install 'octocov-go-test-bench'
  end
end
