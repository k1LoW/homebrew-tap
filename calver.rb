class Calver < Formula
  desc 'calver package provides the ability to work with Calendar Versioning in Go.'
  version '1.0.0'
  homepage 'https://github.com/k1LoW/calver'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/calver/releases/download/v1.0.0/calver_v1.0.0_darwin_arm64.zip'
      sha256 '7babee5812523f57af5402ce92ba194b438d3d5a6b80348f7d97fad7f68f9770'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/calver/releases/download/v1.0.0/calver_v1.0.0_darwin_amd64.zip'
      sha256 'a75acfbade8611a35ba6a30d4e655cf7c4efc699fc7bf0b5942058c5c4ed5797'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/calver/releases/download/v1.0.0/calver_v1.0.0_linux_amd64.tar.gz'
      sha256 '33c0d1eae34e05847a046f51c301b7f655b35a60d4f47121f3ef8192f80f7e87'
    end
  end

  head do
    url 'https://github.com/k1LoW/calver.git'
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    bin.install 'calver'
  end
end
