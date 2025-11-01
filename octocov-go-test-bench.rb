class OctocovGoTestBench < Formula
  desc 'Generate custom metrics JSON from the output of `go test -bench`.'
  version '1.7.1'
  homepage 'https://github.com/k1LoW/octocov-go-test-bench'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/octocov-go-test-bench/releases/download/v1.7.1/octocov-go-test-bench_v1.7.1_darwin_arm64.zip'
      sha256 'be0eedfc2a01f803e3074479b6af29f3d441c9656ebfca67110a31fad67d5792'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov-go-test-bench/releases/download/v1.7.1/octocov-go-test-bench_v1.7.1_darwin_amd64.zip'
      sha256 '1303bfde8ff0d2e2de4f3412ccea59e5e0d6e627eaf82b188280d695ee450bc5'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/octocov-go-test-bench/releases/download/v1.7.1/octocov-go-test-bench_v1.7.1_linux_arm64.tar.gz'
      sha256 '1a9d1610dc18ff2252bd4b417118221f2fceb1127c54235846768123205f644d'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov-go-test-bench/releases/download/v1.7.1/octocov-go-test-bench_v1.7.1_linux_amd64.tar.gz'
      sha256 '6436c9174836297b65c3cb2ed9fb51d127bf8b9134308c2df037e0924b992a6f'
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
