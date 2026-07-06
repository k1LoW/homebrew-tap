class OctocovCachegrind < Formula
  desc 'Generate octocov custom metrics JSON from the output of `valgrind --tool=cachegrind`.'
  version '0.2.7'
  homepage 'https://github.com/k1LoW/octocov-cachegrind'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/octocov-cachegrind/releases/download/v0.2.7/octocov-cachegrind_v0.2.7_darwin_arm64.zip'
      sha256 'bd2f954c4aae6f6a7c7bfe8f7a8e50829524ee21bd9c8a2c065a5eaf8bb0bc10'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov-cachegrind/releases/download/v0.2.7/octocov-cachegrind_v0.2.7_darwin_amd64.zip'
      sha256 '025831079404dcd83403e741434b925035798e90512452314c54f322272f1062'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/octocov-cachegrind/releases/download/v0.2.7/octocov-cachegrind_v0.2.7_linux_arm64.tar.gz'
      sha256 'e7068dd9a08590c82f1ee78a6fff2712f508bd8f8c7245337131a59d363e2928'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov-cachegrind/releases/download/v0.2.7/octocov-cachegrind_v0.2.7_linux_amd64.tar.gz'
      sha256 '559f3c8480c63f7fec74146fb18585022adeb573f9b65df78fdfe60c00992243'
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
