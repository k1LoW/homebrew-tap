class OctocovGoTestBench < Formula
  desc 'Generate custom metrics JSON from the output of `go test -bench`.'
  version '1.7.4'
  homepage 'https://github.com/k1LoW/octocov-go-test-bench'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/octocov-go-test-bench/releases/download/v1.7.4/octocov-go-test-bench_v1.7.4_darwin_arm64.zip'
      sha256 '76d055cc14307b0c5b12be1dd95fc2cf7602db848414b2ea7d492858518bcada'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov-go-test-bench/releases/download/v1.7.4/octocov-go-test-bench_v1.7.4_darwin_amd64.zip'
      sha256 'bc474ced0948ed4bcd807b45d1418bf689b29fa7fe3861249210b35743ab54a6'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/octocov-go-test-bench/releases/download/v1.7.4/octocov-go-test-bench_v1.7.4_linux_arm64.tar.gz'
      sha256 '31400e9c6f2ecf20f578043c2f0634cae068bde55e4ab2c88d86cc050cb0fac9'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov-go-test-bench/releases/download/v1.7.4/octocov-go-test-bench_v1.7.4_linux_amd64.tar.gz'
      sha256 '211a482247e2c8295fe4a16bf6a01c9a0b7d45a4baff3f9d3839e21734c3f233'
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
