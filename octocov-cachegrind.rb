class OctocovCachegrind < Formula
  desc 'Generate octocov custom metrics JSON from the output of `valgrind --tool=cachegrind`.'
  version '0.2.1'
  homepage 'https://github.com/k1LoW/octocov-cachegrind'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/octocov-cachegrind/releases/download/v0.2.1/octocov-cachegrind_v0.2.1_darwin_arm64.zip'
      sha256 '118d112ae790a2ecf869c15d40b19140b5e078f6f0b11ed4617408dd148baf2e'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov-cachegrind/releases/download/v0.2.1/octocov-cachegrind_v0.2.1_darwin_amd64.zip'
      sha256 '69ec893c7f685707b786ea5da68c0581db70d098e48a6f1dfd7cdd3bc4913179'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/octocov-cachegrind/releases/download/v0.2.1/octocov-cachegrind_v0.2.1_linux_arm64.tar.gz'
      sha256 'ab52699f59365e0995012737f0733a462e4b9e0d987c68615d42f47ec7abf6a6'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov-cachegrind/releases/download/v0.2.1/octocov-cachegrind_v0.2.1_linux_amd64.tar.gz'
      sha256 '216f7b4dcb95ab642e9c9c55b0d7eabfce8df24941097510657cb968659d3a24'
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
