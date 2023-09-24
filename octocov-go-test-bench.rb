class OctocovGoTestBench < Formula
  desc 'Generate custom metrics JSON from the output of `go test -bench`.'
  version '1.3.0'
  homepage 'https://github.com/k1LoW/octocov-go-test-bench'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/octocov-go-test-bench/releases/download/v1.3.0/octocov-go-test-bench_v1.3.0_darwin_arm64.zip'
      sha256 '843692083dd9b9dbe917655feabe6fc7b5d7bd11e60341b00afc50ffe45c0f7e'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov-go-test-bench/releases/download/v1.3.0/octocov-go-test-bench_v1.3.0_darwin_amd64.zip'
      sha256 '22b9d615debe1f8282e33a4091a977ce08deada1d95fa2c467a0a8c13a659e6d'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/octocov-go-test-bench/releases/download/v1.3.0/octocov-go-test-bench_v1.3.0_linux_arm64.tar.gz'
      sha256 '1d08a53dc924f1bf918ee21bf7cc46c076c94f9ada743b8fdff2abe592010a5d'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov-go-test-bench/releases/download/v1.3.0/octocov-go-test-bench_v1.3.0_linux_amd64.tar.gz'
      sha256 'de9636dea798da6b3458ed8685ef94a82ed485676a488fdfa4b3901fba16e766'
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
