class OctocovGoTestBench < Formula
  desc 'Generate custom metrics JSON from the output of `go test -bench`.'
  version '1.7.2'
  homepage 'https://github.com/k1LoW/octocov-go-test-bench'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/octocov-go-test-bench/releases/download/v1.7.2/octocov-go-test-bench_v1.7.2_darwin_arm64.zip'
      sha256 '56cdddf3c2b0d6437b84c635c1bffe097f90ea13f99ce0b8d98b4d01d503c7d5'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov-go-test-bench/releases/download/v1.7.2/octocov-go-test-bench_v1.7.2_darwin_amd64.zip'
      sha256 '790ba0719b1d6cb3daa0b4903bf767dfa306dd6bab38ab73ea80a6d1afa0e9c4'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/octocov-go-test-bench/releases/download/v1.7.2/octocov-go-test-bench_v1.7.2_linux_arm64.tar.gz'
      sha256 '35348571b1854de963be973d549c769e5fb12b3985c985a108366e4a3b32ce46'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov-go-test-bench/releases/download/v1.7.2/octocov-go-test-bench_v1.7.2_linux_amd64.tar.gz'
      sha256 '21125183e9758c85450d0a1bc555d6924a6ac0d60c9307302983e1ffdd61d8d8'
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
