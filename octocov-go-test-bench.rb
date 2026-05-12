class OctocovGoTestBench < Formula
  desc 'Generate custom metrics JSON from the output of `go test -bench`.'
  version '1.7.8'
  homepage 'https://github.com/k1LoW/octocov-go-test-bench'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/octocov-go-test-bench/releases/download/v1.7.8/octocov-go-test-bench_v1.7.8_darwin_arm64.zip'
      sha256 '8ffb6fb6b267e84eec53f94eef2bd30be0a2d4d0dc596d5395d87626bec62104'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov-go-test-bench/releases/download/v1.7.8/octocov-go-test-bench_v1.7.8_darwin_amd64.zip'
      sha256 'cd9a4b09517ee7d87a9e21eb2a829e93abef127677f6a6fc21bd75b2bb0d8cc5'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/octocov-go-test-bench/releases/download/v1.7.8/octocov-go-test-bench_v1.7.8_linux_arm64.tar.gz'
      sha256 'd1073d79ff38314bcc2a62548973b296f4ba393b0cd46feca52f4d5538500855'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov-go-test-bench/releases/download/v1.7.8/octocov-go-test-bench_v1.7.8_linux_amd64.tar.gz'
      sha256 '178a8e824256bba141f39f6f6bf57ee05295508b81c0c95b72bec8a3fa3ed1aa'
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
