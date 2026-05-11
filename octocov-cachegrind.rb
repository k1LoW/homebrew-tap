class OctocovCachegrind < Formula
  desc 'Generate octocov custom metrics JSON from the output of `valgrind --tool=cachegrind`.'
  version '0.2.6'
  homepage 'https://github.com/k1LoW/octocov-cachegrind'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/octocov-cachegrind/releases/download/v0.2.6/octocov-cachegrind_v0.2.6_darwin_arm64.zip'
      sha256 'ee25f739f992ebb3c8f9ee73c650e60774fbe06fe9008c9c519e52365d6f9bd8'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov-cachegrind/releases/download/v0.2.6/octocov-cachegrind_v0.2.6_darwin_amd64.zip'
      sha256 '32719abd798d5a4fe58cabdaf0a09937640223e0a4f0c643123bad58cd9dda34'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/octocov-cachegrind/releases/download/v0.2.6/octocov-cachegrind_v0.2.6_linux_arm64.tar.gz'
      sha256 '2e9bfcfddf8210b6781f4cbb6003711f77de6f6ef50ef0c600538d4d56914dd5'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov-cachegrind/releases/download/v0.2.6/octocov-cachegrind_v0.2.6_linux_amd64.tar.gz'
      sha256 'f8af8385438eaf4e80a92c49a67d3e00327d165c9e96b60d9cc8bf6bf926b071'
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
