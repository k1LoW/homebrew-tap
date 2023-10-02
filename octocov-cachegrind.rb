class OctocovCachegrind < Formula
  desc 'Generate octocov custom metrics JSON from the output of `valgrind --tool=cachegrind`.'
  version '0.1.1'
  homepage 'https://github.com/k1LoW/octocov-cachegrind'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/octocov-cachegrind/releases/download/v0.1.1/octocov-cachegrind_v0.1.1_darwin_arm64.zip'
      sha256 'faf978261ba6c02fbfbb99214bf63ab16a7a9dad1c13c00b79fc5ffd514e975c'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov-cachegrind/releases/download/v0.1.1/octocov-cachegrind_v0.1.1_darwin_amd64.zip'
      sha256 '1163a384bd258a1b41b33f4fdbf36478ddd45062183ddd6140016aab2ca6b3ea'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/octocov-cachegrind/releases/download/v0.1.1/octocov-cachegrind_v0.1.1_linux_arm64.tar.gz'
      sha256 '0c560e99c7e3226249ff602c6ec3d9c6c2a82486f147aeb87a4a349541063e62'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov-cachegrind/releases/download/v0.1.1/octocov-cachegrind_v0.1.1_linux_amd64.tar.gz'
      sha256 '24e5384f6228291ced98f58e6669a9dbad8336d6676364e070af75d329bfff1a'
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
