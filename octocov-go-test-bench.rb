class OctocovGoTestBench < Formula
  desc 'Generate custom metrics JSON from the output of `go test -bench`.'
  version '1.0.0'
  homepage 'https://github.com/k1LoW/octocov-go-test-bench'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/octocov-go-test-bench/releases/download/v1.0.0/octocov-go-test-bench_v1.0.0_darwin_arm64.zip'
      sha256 'ab8ced944d6cac9ba58e2590f305f6a025fac9c8881106bfa74160eb17b0c27d'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov-go-test-bench/releases/download/v1.0.0/octocov-go-test-bench_v1.0.0_darwin_amd64.zip'
      sha256 '7984f6f5295b1477c302320344e5cf5a5646fbd30d4ec3c2bc2bfe066b7b8eac'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/octocov-go-test-bench/releases/download/v1.0.0/octocov-go-test-bench_v1.0.0_linux_arm64.tar.gz'
      sha256 '20ce09825e0d25f48d3e5f5a233ec76119b6d49748a28e6827286d9fb40a4dd4'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov-go-test-bench/releases/download/v1.0.0/octocov-go-test-bench_v1.0.0_linux_amd64.tar.gz'
      sha256 '121e23b505059fcd791c7bb7d41eed2c1fec7ac683b1fc3482ce73b6edbc69ce'
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
