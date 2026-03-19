class OctocovGoTestBench < Formula
  desc 'Generate custom metrics JSON from the output of `go test -bench`.'
  version '1.7.6'
  homepage 'https://github.com/k1LoW/octocov-go-test-bench'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/octocov-go-test-bench/releases/download/v1.7.6/octocov-go-test-bench_v1.7.6_darwin_arm64.zip'
      sha256 '1ccffe2d41c746e49f1a39ba0ff703875fe386a3df379e1dd8a980ede7a9d80e'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov-go-test-bench/releases/download/v1.7.6/octocov-go-test-bench_v1.7.6_darwin_amd64.zip'
      sha256 '6388a9111e0f67de593b68e78549cf44e278329d3580a2793735b6c510cd110b'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/octocov-go-test-bench/releases/download/v1.7.6/octocov-go-test-bench_v1.7.6_linux_arm64.tar.gz'
      sha256 '8273ae3b19e5ce3e3efc382c66ab79f16e7bb9dca65602ccd0f7d49640eeb303'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov-go-test-bench/releases/download/v1.7.6/octocov-go-test-bench_v1.7.6_linux_amd64.tar.gz'
      sha256 '538c8d06a8df793deaf69f34fcae12ae0ac4e73e1e71bdda156bb0c892b5f2c4'
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
