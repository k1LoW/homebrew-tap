class OctocovGoTestBench < Formula
  desc 'Generate custom metrics JSON from the output of `go test -bench`.'
  version '1.2.0'
  homepage 'https://github.com/k1LoW/octocov-go-test-bench'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/octocov-go-test-bench/releases/download/v1.2.0/octocov-go-test-bench_v1.2.0_darwin_arm64.zip'
      sha256 'cb47dec376a1bc5c76889eeb6d2b3ad967c951ab5f870563ebce5c665b8597b0'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov-go-test-bench/releases/download/v1.2.0/octocov-go-test-bench_v1.2.0_darwin_amd64.zip'
      sha256 '1ae56dd987be86dbcd722ebb12a5ecc77c5cff0ff0684b91ab293bd14b5c5eb2'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/octocov-go-test-bench/releases/download/v1.2.0/octocov-go-test-bench_v1.2.0_linux_arm64.tar.gz'
      sha256 '89e80c6335750fa1cfbc93eb765edefa07e7f40ea7bc692a9a32c623fc1c6953'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov-go-test-bench/releases/download/v1.2.0/octocov-go-test-bench_v1.2.0_linux_amd64.tar.gz'
      sha256 '56c6895ff8855963335851fadb3abf4d9f474db176eddd303b177220dbaebd45'
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
