class OctocovGoTestBench < Formula
  desc 'Generate custom metrics JSON from the output of `go test -bench`.'
  version '0.1.0'
  homepage 'https://github.com/k1LoW/octocov-go-test-bench'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/octocov-go-test-bench/releases/download/v0.1.0/octocov-go-test-bench_v0.1.0_darwin_arm64.zip'
      sha256 '2ec556f3e5ccdf2cd9ec8c3ca1c9cc550981247ed93faff43c7d10f4cbbbc5f1'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov-go-test-bench/releases/download/v0.1.0/octocov-go-test-bench_v0.1.0_darwin_amd64.zip'
      sha256 'f08eda8b1c3d704989ca5ca5d7b89de7c7e5016f129a950a4320231a9fed3b40'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/octocov-go-test-bench/releases/download/v0.1.0/octocov-go-test-bench_v0.1.0_linux_arm64.tar.gz'
      sha256 'df1e4cce776ca6b1ba354436e553bed444b54438331f3bf6e74401717c961b06'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov-go-test-bench/releases/download/v0.1.0/octocov-go-test-bench_v0.1.0_linux_amd64.tar.gz'
      sha256 '372a3303e638d6b9cd7de495c9d40934e0cb308f2edcd474a20931df33a6e341'
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
