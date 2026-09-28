class Envdo < Formula
  version '0.2.2'
  homepage 'https://github.com/k1LoW/envdo'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/envdo/releases/download/v0.2.2/envdo_v0.2.2_darwin_arm64.zip'
      sha256 '2423bcedfdb7d919a3e909d8de5d58f96cb9117d2bd98f38d10b472645db94cc'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/envdo/releases/download/v0.2.2/envdo_v0.2.2_darwin_amd64.zip'
      sha256 'fd9270b362de472a778617f23d21250caab7fc48318fa69b8e9eb50cb6e590c0'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/envdo/releases/download/v0.2.2/envdo_v0.2.2_linux_arm64.tar.gz'
      sha256 'f479b3a816d732184b9d4c62ca148d955dcf14ba75be2fc9e7742ad055f3ae6f'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/envdo/releases/download/v0.2.2/envdo_v0.2.2_linux_amd64.tar.gz'
      sha256 '246ae072dea356c944cb767af45c22e18dc8d7db5515de6a1d9f3952bf42a326'
    end
  end

  head do
    url 'https://github.com/k1LoW/envdo.git'
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    bin.install 'envdo'
  end
end
