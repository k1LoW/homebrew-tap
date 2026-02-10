class OctocovCachegrind < Formula
  desc 'Generate octocov custom metrics JSON from the output of `valgrind --tool=cachegrind`.'
  version '0.2.4'
  homepage 'https://github.com/k1LoW/octocov-cachegrind'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/octocov-cachegrind/releases/download/v0.2.4/octocov-cachegrind_v0.2.4_darwin_arm64.zip'
      sha256 '00abbeda6edc4ce98d6b2f316230ed90f6a16604a2e7142a3ef7a63cb584cb36'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov-cachegrind/releases/download/v0.2.4/octocov-cachegrind_v0.2.4_darwin_amd64.zip'
      sha256 '88b7945886c1ac9bc766f8a32f87164aa55b94dcb64eaa6dc9a050d12f002734'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/octocov-cachegrind/releases/download/v0.2.4/octocov-cachegrind_v0.2.4_linux_arm64.tar.gz'
      sha256 '7ac8427185df50d176b20884e754efaa39a2712ab4f559ee63a08f3897e334c5'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov-cachegrind/releases/download/v0.2.4/octocov-cachegrind_v0.2.4_linux_amd64.tar.gz'
      sha256 '861a5d02b8691e7f3c7d00c9211eca0dd6ef4b0164ce948ece5e79b7379887fd'
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
