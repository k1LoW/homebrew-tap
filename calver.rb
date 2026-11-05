class Calver < Formula
  desc 'calver package provides the ability to work with Calendar Versioning in Go.'
  version '1.1.0'
  homepage 'https://github.com/k1LoW/calver'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/calver/releases/download/v1.1.0/calver_v1.1.0_darwin_arm64.zip'
      sha256 '67187943654c73415053dc45e8c229f66f51e6abd8a302c0123ea6df6c41b970'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/calver/releases/download/v1.1.0/calver_v1.1.0_darwin_amd64.zip'
      sha256 '5f6a0b43fdac2f74743f0519bd114c9d6a412e938df7394e1f399914270032ef'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/calver/releases/download/v1.1.0/calver_v1.1.0_linux_amd64.tar.gz'
      sha256 'd3f6f690952805bc674cf208726807ad36f0129ca858bb1bfac1588e53a1514b'
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
