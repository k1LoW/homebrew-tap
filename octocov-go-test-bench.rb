class OctocovGoTestBench < Formula
  desc 'Generate custom metrics JSON from the output of `go test -bench`.'
  version '1.7.0'
  homepage 'https://github.com/k1LoW/octocov-go-test-bench'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/octocov-go-test-bench/releases/download/v1.7.0/octocov-go-test-bench_v1.7.0_darwin_arm64.zip'
      sha256 '5ed8971771fb5dd0d985eeba08bbd360698890231fc1dc7a891c83e670ee2161'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov-go-test-bench/releases/download/v1.7.0/octocov-go-test-bench_v1.7.0_darwin_amd64.zip'
      sha256 'b0dd196fae9fc763be3450a51084afbe8f30c5db324059b2e1816d0911e22158'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/octocov-go-test-bench/releases/download/v1.7.0/octocov-go-test-bench_v1.7.0_linux_arm64.tar.gz'
      sha256 '07001a87bd93e907540095a2314de3f2046037c088d341f5722eee4f459a188f'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov-go-test-bench/releases/download/v1.7.0/octocov-go-test-bench_v1.7.0_linux_amd64.tar.gz'
      sha256 '64dc74456ea46f6547bfab768684609ff521dbba566744125e62ef648be45db0'
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
