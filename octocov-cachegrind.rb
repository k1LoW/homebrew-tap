class OctocovCachegrind < Formula
  desc 'Generate octocov custom metrics JSON from the output of `valgrind --tool=cachegrind`.'
  version '0.2.2'
  homepage 'https://github.com/k1LoW/octocov-cachegrind'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/octocov-cachegrind/releases/download/v0.2.2/octocov-cachegrind_v0.2.2_darwin_arm64.zip'
      sha256 'f61f1b0a849f5304053d5a22430b853b9d979b23b8dcb671d00bf24ecb4fbc88'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov-cachegrind/releases/download/v0.2.2/octocov-cachegrind_v0.2.2_darwin_amd64.zip'
      sha256 'd06d8f75750bff9ddfc17465f47f42a77351de01e87efded3f66c1b788b6936d'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/octocov-cachegrind/releases/download/v0.2.2/octocov-cachegrind_v0.2.2_linux_arm64.tar.gz'
      sha256 'e56ab912db811533f7cb5be559193c596cf23df75443b1e3a36332a7a5e57c79'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov-cachegrind/releases/download/v0.2.2/octocov-cachegrind_v0.2.2_linux_amd64.tar.gz'
      sha256 'f73a802cf4e5b8a800d4817a1f378d5db23c4b04b822f334bddbcfc8b03457dc'
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
