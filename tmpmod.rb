class Tmpmod < Formula
  desc 'tmpmod is a tool for temporary use of modified modules.'
  version '0.0.1'
  homepage 'https://github.com/k1LoW/tmpmod'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/tmpmod/releases/download/v0.0.1/tmpmod_v0.0.1_darwin_arm64.zip'
      sha256 'ffcfaf2b1b8c6d502eb1e131f9d3ba565de87594f14fd8099d184a5ac8740800'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tmpmod/releases/download/v0.0.1/tmpmod_v0.0.1_darwin_amd64.zip'
      sha256 'b279516019016e22c98dbe9f9b28593adc2f0b5ce524fc2ec6f681cc64ee9d59'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/tmpmod/releases/download/v0.0.1/tmpmod_v0.0.1_linux_arm64.tar.gz'
      sha256 '9057c8e64612d66a2518073a5f6e8660cf16b7c61c19fe8032a7e3faeff7fa64'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tmpmod/releases/download/v0.0.1/tmpmod_v0.0.1_linux_amd64.tar.gz'
      sha256 'b400a0546c877c69c59b4d3aa537a8a0e6c60ca9d24503f1920c1dd0fd712e81'
    end
  end

  head do
    url 'https://github.com/k1LoW/tmpmod.git'
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    bin.install 'tmpmod'
  end
end
