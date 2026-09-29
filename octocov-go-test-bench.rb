class OctocovGoTestBench < Formula
  desc 'Generate custom metrics JSON from the output of `go test -bench`.'
  version '1.7.11'
  homepage 'https://github.com/k1LoW/octocov-go-test-bench'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/octocov-go-test-bench/releases/download/v1.7.11/octocov-go-test-bench_v1.7.11_darwin_arm64.zip'
      sha256 'ed672217188cecda606006fea8fa12fb016d2c91b9ed5dd1e033282c41a705ae'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov-go-test-bench/releases/download/v1.7.11/octocov-go-test-bench_v1.7.11_darwin_amd64.zip'
      sha256 '223078998708b3a39a74e95ec649edeabb873cc428b4d44c18a75b699b631213'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/octocov-go-test-bench/releases/download/v1.7.11/octocov-go-test-bench_v1.7.11_linux_arm64.tar.gz'
      sha256 'd2ff3b75c2478c879b31108c58faaf33f5f5ca3955978ef1fbc206bbcafa63be'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov-go-test-bench/releases/download/v1.7.11/octocov-go-test-bench_v1.7.11_linux_amd64.tar.gz'
      sha256 '3af34cfb8034e7f2a2c273aaf52a9fd93817c97bc232d3807039b7474fda7fa1'
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
