class OctocovGoTestBench < Formula
  desc 'Generate custom metrics JSON from the output of `go test -bench`.'
  version '1.5.0'
  homepage 'https://github.com/k1LoW/octocov-go-test-bench'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/octocov-go-test-bench/releases/download/v1.5.0/octocov-go-test-bench_v1.5.0_darwin_arm64.zip'
      sha256 '8942ed18bdf395db726aa7825575bbe4a8aff2ece64f7b011bc6c7fbddf331ce'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov-go-test-bench/releases/download/v1.5.0/octocov-go-test-bench_v1.5.0_darwin_amd64.zip'
      sha256 'c58fd1da4c1d30668f97186220d25d43ebfdf402e267b20674b2ae4c320cb573'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/octocov-go-test-bench/releases/download/v1.5.0/octocov-go-test-bench_v1.5.0_linux_arm64.tar.gz'
      sha256 '9ee1113e8e767b07c3c84b221b2ae9ad062229f4ade6a1963ad432eaaa23c827'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov-go-test-bench/releases/download/v1.5.0/octocov-go-test-bench_v1.5.0_linux_amd64.tar.gz'
      sha256 'c373a1f1efbbdb8edaffeb4b02aff0f486f2743f84ec105df2c668587d5896b4'
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
