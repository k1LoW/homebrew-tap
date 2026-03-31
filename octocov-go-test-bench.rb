class OctocovGoTestBench < Formula
  desc 'Generate custom metrics JSON from the output of `go test -bench`.'
  version '1.7.7'
  homepage 'https://github.com/k1LoW/octocov-go-test-bench'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/octocov-go-test-bench/releases/download/v1.7.7/octocov-go-test-bench_v1.7.7_darwin_arm64.zip'
      sha256 'a1eaecbe62c62e0c293060972d1ad5c12f734877cee8579bf3f87aafb72129e6'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov-go-test-bench/releases/download/v1.7.7/octocov-go-test-bench_v1.7.7_darwin_amd64.zip'
      sha256 'dd2da982239fa47d505132a12d99dc71f3a11865136d792048e0150e6899716a'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/octocov-go-test-bench/releases/download/v1.7.7/octocov-go-test-bench_v1.7.7_linux_arm64.tar.gz'
      sha256 '0f24a0c4ad771d1c51f2d86ecf2d44d0eac7920a1feffdc9468f81a7a2db95f8'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov-go-test-bench/releases/download/v1.7.7/octocov-go-test-bench_v1.7.7_linux_amd64.tar.gz'
      sha256 '88f2ed6c3ab2ea756fb2b064e5ec5231ef7f6e2d5240a981042f43174c50e51d'
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
