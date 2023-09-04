class OctocovGoTestBench < Formula
  desc 'Generate custom metrics JSON from the output of `go test -bench`.'
  version '1.1.0'
  homepage 'https://github.com/k1LoW/octocov-go-test-bench'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/octocov-go-test-bench/releases/download/v1.1.0/octocov-go-test-bench_v1.1.0_darwin_arm64.zip'
      sha256 'c41d9900e75704a41d4342d89f32cb5a8af7756dfde593243c593d889f4291c1'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov-go-test-bench/releases/download/v1.1.0/octocov-go-test-bench_v1.1.0_darwin_amd64.zip'
      sha256 'e46480d466aafc9876a45e5229d6a44ac1ca6c8c07bff7d1b084094714039b47'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/octocov-go-test-bench/releases/download/v1.1.0/octocov-go-test-bench_v1.1.0_linux_arm64.tar.gz'
      sha256 'ed9c41e10f70adaefd58360eb5101428db8fea0aee57cd6d626bc1499c70507d'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov-go-test-bench/releases/download/v1.1.0/octocov-go-test-bench_v1.1.0_linux_amd64.tar.gz'
      sha256 'f43d91194913bf6882be058de215a815b31e2b99c38e4b9a6071108ea9bb8bbe'
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
