class Dirtop < Formula
  desc 'List per-directory CPU and memory usage of running processes'
  version '0.1.2'
  homepage 'https://github.com/k1LoW/dirtop'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/dirtop/releases/download/v0.1.2/dirtop_v0.1.2_darwin_arm64.zip'
      sha256 'ab6768f542f92ab695320e3856991cbe3e28f134cec14e9e6c823a3c621f65c2'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/dirtop/releases/download/v0.1.2/dirtop_v0.1.2_darwin_amd64.zip'
      sha256 'bc389642a46c23a42a945dda44a8b518e790f5b948e5ff6703818220469fe070'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/dirtop/releases/download/v0.1.2/dirtop_v0.1.2_linux_arm64.tar.gz'
      sha256 'd56a8809afe51f4293d566bc2add2d85f8b7a3945287bcb4a6d5d0b71c40d5ce'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/dirtop/releases/download/v0.1.2/dirtop_v0.1.2_linux_amd64.tar.gz'
      sha256 '9f0193ed03963b5807319f4ed53954a6f872c54f1062f4f753f5d1d1f2a18985'
    end
  end

  head do
    url 'https://github.com/k1LoW/dirtop.git'
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    bin.install 'dirtop'
  end
end
