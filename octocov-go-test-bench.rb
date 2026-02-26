class OctocovGoTestBench < Formula
  desc 'Generate custom metrics JSON from the output of `go test -bench`.'
  version '1.7.5'
  homepage 'https://github.com/k1LoW/octocov-go-test-bench'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/octocov-go-test-bench/releases/download/v1.7.5/octocov-go-test-bench_v1.7.5_darwin_arm64.zip'
      sha256 '1a6bb10156780d514ef457c1c17924acd1aea2a82e93f1f713d876a5b52349ce'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov-go-test-bench/releases/download/v1.7.5/octocov-go-test-bench_v1.7.5_darwin_amd64.zip'
      sha256 'a0244a0123861fe06c125cd78d6ba4ada2db3023c837be4ba3d894870a670601'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/octocov-go-test-bench/releases/download/v1.7.5/octocov-go-test-bench_v1.7.5_linux_arm64.tar.gz'
      sha256 '72af522f299784b365d06ef5c2b75ae1ae346bb7802708ab43623db6909cf87f'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov-go-test-bench/releases/download/v1.7.5/octocov-go-test-bench_v1.7.5_linux_amd64.tar.gz'
      sha256 '0c5196d5f5bee98fe459187e076f9a83ae151ecbf168c1f9cf4f3e916584481c'
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
