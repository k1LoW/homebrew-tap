class Dirtop < Formula
  desc 'List per-directory CPU and memory usage of running processes'
  version '0.1.0'
  homepage 'https://github.com/k1LoW/dirtop'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/dirtop/releases/download/v0.1.0/dirtop_v0.1.0_darwin_arm64.zip'
      sha256 '9d205e00dfca415cbfbc3326beb5fe44d715e153acd2320610567c451112f897'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/dirtop/releases/download/v0.1.0/dirtop_v0.1.0_darwin_amd64.zip'
      sha256 '414e3706a12e2a08aa021a1ece51acbf4d834923e2a15ad01449bf046a92c429'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/dirtop/releases/download/v0.1.0/dirtop_v0.1.0_linux_arm64.tar.gz'
      sha256 'a40a696c67faaaf45520593c850113d72a0e99d724b72b7f1ce8f0d728a61a71'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/dirtop/releases/download/v0.1.0/dirtop_v0.1.0_linux_amd64.tar.gz'
      sha256 '3a2a1cc589936b827b821e8ceef3f11257065335e959560e09f3f41a492556d7'
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
