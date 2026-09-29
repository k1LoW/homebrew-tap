class OctocovRunnCoverage < Formula
  desc "Generate octocov custom metrics JSON from the output of 'runn coverage'."
  version '0.1.14'
  homepage 'https://github.com/k1LoW/octocov-runn-coverage'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/octocov-runn-coverage/releases/download/v0.1.14/octocov-runn-coverage_v0.1.14_darwin_arm64.zip'
      sha256 '07cd3007c4931f8d05e848c6606c7c053d865df06d80aad10bd492f738f0a8fa'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov-runn-coverage/releases/download/v0.1.14/octocov-runn-coverage_v0.1.14_darwin_amd64.zip'
      sha256 'e3437a8daffb71d6ac8b0a3761b87e4f9665090eb9a3dcf7f16889527b5da7f0'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/octocov-runn-coverage/releases/download/v0.1.14/octocov-runn-coverage_v0.1.14_linux_arm64.tar.gz'
      sha256 'da7ebaf34766ea0e13673f856d0ad6eb9ad0cf29f1fa84ce3aff0854b8e54c1c'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov-runn-coverage/releases/download/v0.1.14/octocov-runn-coverage_v0.1.14_linux_amd64.tar.gz'
      sha256 '0f419ac9563e568521909e2cf1db68f7d9f1af1526e9f0cc986e67207804e3fb'
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
