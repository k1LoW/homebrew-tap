class OctocovRunnCoverage < Formula
  desc "Generate octocov custom metrics JSON from the output of 'runn coverage'."
  version '0.1.15'
  homepage 'https://github.com/k1LoW/octocov-runn-coverage'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/octocov-runn-coverage/releases/download/v0.1.15/octocov-runn-coverage_v0.1.15_darwin_arm64.zip'
      sha256 '81977cf0036409b5c715b4e873daa8d34b48c2524a5e19e953369c1cd6f87773'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov-runn-coverage/releases/download/v0.1.15/octocov-runn-coverage_v0.1.15_darwin_amd64.zip'
      sha256 'df1dc6e7d9afec20058cfecb7289ee21f8d2a54335f773035c71086ef5db597f'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/octocov-runn-coverage/releases/download/v0.1.15/octocov-runn-coverage_v0.1.15_linux_arm64.tar.gz'
      sha256 '0042c148abb73082487703c2c926e940c781167d6a3fe7dd2573be3651fc5a2b'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov-runn-coverage/releases/download/v0.1.15/octocov-runn-coverage_v0.1.15_linux_amd64.tar.gz'
      sha256 '74a4c2daca73851136f382666e786acee074f2dc4b2df88655217f1847dd1aaf'
    end
  end

  head do
    url 'https://github.com/k1LoW/octocov-runn-coverage.git'
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    bin.install 'octocov-runn-coverage'
  end
end
