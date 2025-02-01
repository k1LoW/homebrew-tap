class OctocovGoTestBench < Formula
  desc 'Generate custom metrics JSON from the output of `go test -bench`.'
  version '1.4.1'
  homepage 'https://github.com/k1LoW/octocov-go-test-bench'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/octocov-go-test-bench/releases/download/v1.4.1/octocov-go-test-bench_v1.4.1_darwin_arm64.zip'
      sha256 'ea3ec7799dfa74ac7bd17d51f47a412ade5f6469e30f001e8c0d8ed9930c4b07'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov-go-test-bench/releases/download/v1.4.1/octocov-go-test-bench_v1.4.1_darwin_amd64.zip'
      sha256 'fc71cfa56aab1d65f1af613b9d8ed457fd13d07bbad7bb19f065ac0823864aae'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/octocov-go-test-bench/releases/download/v1.4.1/octocov-go-test-bench_v1.4.1_linux_arm64.tar.gz'
      sha256 '7730357800789276df527fc0ca5d22f2ff42b6f260e40830c6a1eb811f9518d2'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov-go-test-bench/releases/download/v1.4.1/octocov-go-test-bench_v1.4.1_linux_amd64.tar.gz'
      sha256 'c568e0605b61c02cf93730458e570dee3385dde63150d718cb6604e64eadc351'
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
