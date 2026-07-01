class OctocovGoTestBench < Formula
  desc 'Generate custom metrics JSON from the output of `go test -bench`.'
  version '1.7.10'
  homepage 'https://github.com/k1LoW/octocov-go-test-bench'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/octocov-go-test-bench/releases/download/v1.7.10/octocov-go-test-bench_v1.7.10_darwin_arm64.zip'
      sha256 '434c4b6a08fe21ce50afcc459cb3c8d3f817b07b34caac5dbfd2a8226865c4e9'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov-go-test-bench/releases/download/v1.7.10/octocov-go-test-bench_v1.7.10_darwin_amd64.zip'
      sha256 '17069db6f3fdeb2cbad5bdada749ddec1e6eadb6a0b281b40c8eec6b482ba5d8'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/octocov-go-test-bench/releases/download/v1.7.10/octocov-go-test-bench_v1.7.10_linux_arm64.tar.gz'
      sha256 'ede2290c2e3486a704544ee6346e4417f25c74b49f2f8b166696be7f7e9af472'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov-go-test-bench/releases/download/v1.7.10/octocov-go-test-bench_v1.7.10_linux_amd64.tar.gz'
      sha256 '9f812b21a8ea8072d3aeb190d86222f4a35a160f1d73902d2d6d60d93d4b1949'
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
