class OctocovCachegrind < Formula
  desc 'Generate octocov custom metrics JSON from the output of `valgrind --tool=cachegrind`.'
  version '0.2.10'
  homepage 'https://github.com/k1LoW/octocov-cachegrind'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/octocov-cachegrind/releases/download/v0.2.10/octocov-cachegrind_v0.2.10_darwin_arm64.zip'
      sha256 '111b6f560cee072814c9000116bf343671cb6de405747cd6d91caa55ad7f08d8'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov-cachegrind/releases/download/v0.2.10/octocov-cachegrind_v0.2.10_darwin_amd64.zip'
      sha256 '6ec61d19f66745d736025adf9e7fdc2e141296e8289da5b453bdaed68f49a3cf'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/octocov-cachegrind/releases/download/v0.2.10/octocov-cachegrind_v0.2.10_linux_arm64.tar.gz'
      sha256 '4dbb65cd06e125d157fa3e56592a3cb89db294448467fc8810e3d8b64f14b5eb'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov-cachegrind/releases/download/v0.2.10/octocov-cachegrind_v0.2.10_linux_amd64.tar.gz'
      sha256 '69356f2e26fade3e1ce24810c2e35c31b3ee81ffb844effafa6fd199ad5e20b2'
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
