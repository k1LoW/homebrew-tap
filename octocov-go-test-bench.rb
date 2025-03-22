class OctocovGoTestBench < Formula
  desc 'Generate custom metrics JSON from the output of `go test -bench`.'
  version '1.6.1'
  homepage 'https://github.com/k1LoW/octocov-go-test-bench'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/octocov-go-test-bench/releases/download/v1.6.1/octocov-go-test-bench_v1.6.1_darwin_arm64.zip'
      sha256 'a8de9333552cf840bc99424ad6a1cc5e7ffb6081a206d3b351a55e2aa16cbc8f'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov-go-test-bench/releases/download/v1.6.1/octocov-go-test-bench_v1.6.1_darwin_amd64.zip'
      sha256 'a19cb44bef911c827127cff8d80e0f6f404d20ba524bc747372bafe69aca1993'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/octocov-go-test-bench/releases/download/v1.6.1/octocov-go-test-bench_v1.6.1_linux_arm64.tar.gz'
      sha256 '741fcd63a3919d858da5c57137c00bc53ee2327943814932bd060ca8e43a5552'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov-go-test-bench/releases/download/v1.6.1/octocov-go-test-bench_v1.6.1_linux_amd64.tar.gz'
      sha256 '3025de99fc810dbde932f798a7f390673a6c3f92ea92a394df1280fb4ac3490c'
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
