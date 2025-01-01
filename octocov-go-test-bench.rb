class OctocovGoTestBench < Formula
  desc 'Generate custom metrics JSON from the output of `go test -bench`.'
  version '1.4.0'
  homepage 'https://github.com/k1LoW/octocov-go-test-bench'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/octocov-go-test-bench/releases/download/v1.4.0/octocov-go-test-bench_v1.4.0_darwin_arm64.zip'
      sha256 'b83e77ff339705e30415f524ca6e81275e2ad97d774e60c20e623ec219ac2e38'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov-go-test-bench/releases/download/v1.4.0/octocov-go-test-bench_v1.4.0_darwin_amd64.zip'
      sha256 'cc548d5ec3f8f8f606a94f92882477ae195b9893d7da4d5ec8f0628b5ea883e5'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/octocov-go-test-bench/releases/download/v1.4.0/octocov-go-test-bench_v1.4.0_linux_arm64.tar.gz'
      sha256 'd835cbb59e4543b245155dff6319dc44ddd6d6805deb4cee19b6b5b58cb9dc1a'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov-go-test-bench/releases/download/v1.4.0/octocov-go-test-bench_v1.4.0_linux_amd64.tar.gz'
      sha256 'b46351bd168e92ecb90b47d6bc36bebf8eab5cd8883f39475205eb4e1d1f3667'
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
