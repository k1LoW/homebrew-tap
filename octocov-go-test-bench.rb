class OctocovGoTestBench < Formula
  desc 'Generate custom metrics JSON from the output of `go test -bench`.'
  version '1.6.0'
  homepage 'https://github.com/k1LoW/octocov-go-test-bench'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/octocov-go-test-bench/releases/download/v1.6.0/octocov-go-test-bench_v1.6.0_darwin_arm64.zip'
      sha256 '4a2152012d6b5560933a89928a0d71cd056b3454a16b3575b91b1dbc921ccc64'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov-go-test-bench/releases/download/v1.6.0/octocov-go-test-bench_v1.6.0_darwin_amd64.zip'
      sha256 'b9c7439bc9afa3f1dada8a480d2a8d93b3aaf29f671c361e118a78930a6c29f5'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/octocov-go-test-bench/releases/download/v1.6.0/octocov-go-test-bench_v1.6.0_linux_arm64.tar.gz'
      sha256 '16fada68b73afd9b34f556b3fc6e82384b58628bbee7a647f68b37e5cd546f9d'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov-go-test-bench/releases/download/v1.6.0/octocov-go-test-bench_v1.6.0_linux_amd64.tar.gz'
      sha256 '193ab25ef7080052131f0d5ef1ee6ee77f9cba0f6a5870bcee863a72224bd2f9'
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
