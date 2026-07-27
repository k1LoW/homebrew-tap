class OctocovCachegrind < Formula
  desc 'Generate octocov custom metrics JSON from the output of `valgrind --tool=cachegrind`.'
  version '0.2.9'
  homepage 'https://github.com/k1LoW/octocov-cachegrind'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/octocov-cachegrind/releases/download/v0.2.9/octocov-cachegrind_v0.2.9_darwin_arm64.zip'
      sha256 '8e5f5672265d8993703fee59d71e3d8d9c2f8e8983d318eceea7edcffb84cfe6'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov-cachegrind/releases/download/v0.2.9/octocov-cachegrind_v0.2.9_darwin_amd64.zip'
      sha256 'e3ce672277b97394826d36cd3e8cda19d5189f60d2ec6ebcfaa318ca54a126ab'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/octocov-cachegrind/releases/download/v0.2.9/octocov-cachegrind_v0.2.9_linux_arm64.tar.gz'
      sha256 '5cf48101ef31f1e1dc145ddbf0bf4a5e7e507b9efc6ac314466154bbed21d047'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov-cachegrind/releases/download/v0.2.9/octocov-cachegrind_v0.2.9_linux_amd64.tar.gz'
      sha256 '6e7861f2f73351965191dfc9150f14360cb0b82a8859ae023112f3c4a8127c02'
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
