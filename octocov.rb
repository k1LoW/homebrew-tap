class Octocov < Formula
  desc 'octocov is a toolkit for collecting code metrics (code coverage, code to test ratio and test execution time).'
  version '0.79.0'
  license "MIT"
  homepage 'https://github.com/k1LoW/octocov'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.79.0/octocov_v0.79.0_darwin_arm64.zip'
      sha256 'c743eeaa2d85dfe8416fd2c8abd6222f9be7255b37ed95701832d0cb160c29d9'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.79.0/octocov_v0.79.0_darwin_amd64.zip'
      sha256 'd50d6b12e379d1e33978101830d69bc814274bb4a720429afbcb97ab00d84339'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octocov/releases/download/v0.79.0/octocov_v0.79.0_linux_amd64.tar.gz'
      sha256 'e38214079faf1f39d8ba625f4f31b0fb253fffa537d6db21a0e8b64938e3adc5'
    end
  end

  head do
    url 'https://github.com/k1LoW/octocov.git'
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    bin.install 'octocov'
    generate_completions_from_executable(bin/'octocov', 'completion')
  end
end
