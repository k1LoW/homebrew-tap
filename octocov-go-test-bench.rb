class OctocovGoTestBench < Formula
  desc 'Generate custom metrics JSON from the output of `go test -bench`.'
  version '1.7.9'
  homepage 'https://github.com/k1LoW/octocov-go-test-bench'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/octocov-go-test-bench/releases/download/v1.7.9/octocov-go-test-bench_v1.7.9_darwin_arm64.zip'
      sha256 '68857c2e053f995b963e3393efe8a246aa617d2e1de7ea84e4cf2d213dfd998e'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov-go-test-bench/releases/download/v1.7.9/octocov-go-test-bench_v1.7.9_darwin_amd64.zip'
      sha256 'e4ef48ddd164d9709a356f283d9b1a1599456d173a67b06c60af4ae646a7e360'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/octocov-go-test-bench/releases/download/v1.7.9/octocov-go-test-bench_v1.7.9_linux_arm64.tar.gz'
      sha256 '4de536cc2c7cfe9395158a7c274b1621d569cfe876de0085401687aad41cecd6'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov-go-test-bench/releases/download/v1.7.9/octocov-go-test-bench_v1.7.9_linux_amd64.tar.gz'
      sha256 '337072e9afc38f3594ba7869fc4d74b4f35e769dbd5c3a7a0e79f79b3831cc0b'
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
