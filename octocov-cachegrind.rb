class OctocovCachegrind < Formula
  desc 'Generate octocov custom metrics JSON from the output of `valgrind --tool=cachegrind`.'
  version '0.2.3'
  homepage 'https://github.com/k1LoW/octocov-cachegrind'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/octocov-cachegrind/releases/download/v0.2.3/octocov-cachegrind_v0.2.3_darwin_arm64.zip'
      sha256 'f12b40efcc6518c74b4c40ae3d202153870c5e692dbbe990955a22fef9dea182'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov-cachegrind/releases/download/v0.2.3/octocov-cachegrind_v0.2.3_darwin_amd64.zip'
      sha256 '91dd649f904ce31fae60dac31301a03a49c324da404a3a65c85a74d0847495bf'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/octocov-cachegrind/releases/download/v0.2.3/octocov-cachegrind_v0.2.3_linux_arm64.tar.gz'
      sha256 '9a09561d13684797f484b799fd042942e8b0cde8f2c8f51cda57efd221b4802e'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov-cachegrind/releases/download/v0.2.3/octocov-cachegrind_v0.2.3_linux_amd64.tar.gz'
      sha256 '0bde1e88be8d71840c3a0c1e37c2680072b8ee49840008b7f0c7315f19785380'
    end
  end

  head do
    url 'https://github.com/k1LoW/octocov-cachegrind.git'
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    bin.install 'octocov-cachegrind'
  end
end
