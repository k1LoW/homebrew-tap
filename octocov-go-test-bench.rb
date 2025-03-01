class OctocovGoTestBench < Formula
  desc 'Generate custom metrics JSON from the output of `go test -bench`.'
  version '1.4.2'
  homepage 'https://github.com/k1LoW/octocov-go-test-bench'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/octocov-go-test-bench/releases/download/v1.4.2/octocov-go-test-bench_v1.4.2_darwin_arm64.zip'
      sha256 '35b059c4165c1ce304abde6aeb08092d4cdb25ad401dc5b799c0887bda2e130e'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov-go-test-bench/releases/download/v1.4.2/octocov-go-test-bench_v1.4.2_darwin_amd64.zip'
      sha256 'a71385d9fea3ba81922026b9b4a98f7970e5b55b340706d0f77db0caf859a826'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/octocov-go-test-bench/releases/download/v1.4.2/octocov-go-test-bench_v1.4.2_linux_arm64.tar.gz'
      sha256 'd66a64944c94a7513cf9b51d43d2d425ce59bb2d9010d689b41b0fb8677d5e3f'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov-go-test-bench/releases/download/v1.4.2/octocov-go-test-bench_v1.4.2_linux_amd64.tar.gz'
      sha256 '7be34b3b365b0e5acf9eaf6e6e468767932bec65d671db096037a624b7cfc02e'
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
