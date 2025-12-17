class OctocovGoTestBench < Formula
  desc 'Generate custom metrics JSON from the output of `go test -bench`.'
  version '1.7.3'
  homepage 'https://github.com/k1LoW/octocov-go-test-bench'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/octocov-go-test-bench/releases/download/v1.7.3/octocov-go-test-bench_v1.7.3_darwin_arm64.zip'
      sha256 '3f9a79389bf72e47f4f484c4ffccfec2f4197ed5b235c7ba2ea028ba6ee0feed'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov-go-test-bench/releases/download/v1.7.3/octocov-go-test-bench_v1.7.3_darwin_amd64.zip'
      sha256 'c5f9411881f4cf2c046b3b23863f89bd38b3a67c0eef25044dfa339ebd650c47'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/octocov-go-test-bench/releases/download/v1.7.3/octocov-go-test-bench_v1.7.3_linux_arm64.tar.gz'
      sha256 'dfff647eb4e7ed256a5fc4141fabe5f9356f10747eca896445b550cd4cabe857'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov-go-test-bench/releases/download/v1.7.3/octocov-go-test-bench_v1.7.3_linux_amd64.tar.gz'
      sha256 '168f4337471558f74b9ba1f1403f9d35a6ede22196e34f83276fe693833c2578'
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
