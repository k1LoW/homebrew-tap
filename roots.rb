class Roots < Formula
  version '0.1.1'
  homepage 'https://github.com/k1LoW/roots'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/roots/releases/download/v0.1.1/roots_v0.1.1_darwin_arm64.zip'
      sha256 'fff98d0f568e480410e0f44dc7de4a46549cb065ef0dbf00a6c84a6b712ec671'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/roots/releases/download/v0.1.1/roots_v0.1.1_darwin_amd64.zip'
      sha256 'f80eba747bb884d1af0c9d7ef2f61976d0f5bf18a7ea8d0d6725865af3a9ca66'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/roots/releases/download/v0.1.1/roots_v0.1.1_linux_arm64.tar.gz'
      sha256 'a1fea5adfa58140b99b944efa0e4d43bfabb2fdcbb88ccd06373b3ebc15fb1fb'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/roots/releases/download/v0.1.1/roots_v0.1.1_linux_amd64.tar.gz'
      sha256 '5f926d25b80023db3d2ef6521c42664288ba446a465c56c572ba647b97c2fbab'
    end
  end

  head do
    url 'https://github.com/k1LoW/roots.git'
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    bin.install 'roots'
  end
end
