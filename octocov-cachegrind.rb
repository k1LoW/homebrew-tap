class OctocovCachegrind < Formula
  desc 'Generate octocov custom metrics JSON from the output of `valgrind --tool=cachegrind`.'
  version '0.1.2'
  homepage 'https://github.com/k1LoW/octocov-cachegrind'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/octocov-cachegrind/releases/download/v0.1.2/octocov-cachegrind_v0.1.2_darwin_arm64.zip'
      sha256 '19550f20a6270fd8d9e5c6cbd48adc0f915e880d0e3a6163b833554759779f4c'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov-cachegrind/releases/download/v0.1.2/octocov-cachegrind_v0.1.2_darwin_amd64.zip'
      sha256 '2d665aa2abf82088c183deff5da7b10c9500005c8e89d64c7c94278edf85481f'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/octocov-cachegrind/releases/download/v0.1.2/octocov-cachegrind_v0.1.2_linux_arm64.tar.gz'
      sha256 '5afdd5331be9396f8ad13b261de63f7d3f7d6a3ec8dab7ec620f0524ff36162e'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov-cachegrind/releases/download/v0.1.2/octocov-cachegrind_v0.1.2_linux_amd64.tar.gz'
      sha256 '3ae8545d5a9911f5c50b0e5feb0bfd3598a650c3d99c460ddf61d51410d59d15'
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
