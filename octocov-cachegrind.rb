class OctocovCachegrind < Formula
  desc 'Generate octocov custom metrics JSON from the output of `valgrind --tool=cachegrind`.'
  version '0.2.8'
  homepage 'https://github.com/k1LoW/octocov-cachegrind'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/octocov-cachegrind/releases/download/v0.2.8/octocov-cachegrind_v0.2.8_darwin_arm64.zip'
      sha256 'ca4b5235b511091c42664d560f7fdf49b7336f0894138570e8e3303b946b0ded'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov-cachegrind/releases/download/v0.2.8/octocov-cachegrind_v0.2.8_darwin_amd64.zip'
      sha256 '793e8bc0d0c7a00a028a78196dcfad5bf076558a4cc9ec74d505596ae94afc8a'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/octocov-cachegrind/releases/download/v0.2.8/octocov-cachegrind_v0.2.8_linux_arm64.tar.gz'
      sha256 '53ece6f0fdc31a2478d30aa9a4a16479c1f83ea62cc26924e8434aafce6d49d4'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov-cachegrind/releases/download/v0.2.8/octocov-cachegrind_v0.2.8_linux_amd64.tar.gz'
      sha256 '5c12ec5d3fcd5dd14c41d97ccbbe2d3ef0f95b85069a0740383c371ed99bcf3b'
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
