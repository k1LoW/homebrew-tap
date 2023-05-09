class Calver < Formula
  desc 'calver package provides the ability to work with Calendar Versioning in Go.'
  version '0.2.0'
  homepage 'https://github.com/k1LoW/calver'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/calver/releases/download/v0.2.0/calver_v0.2.0_darwin_arm64.zip'
      sha256 '2e65fb47eccc77fea07d0bcd54c01e460d497b859a852ed29f424f331366c0ed'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/calver/releases/download/v0.2.0/calver_v0.2.0_darwin_amd64.zip'
      sha256 '1604b0cd19001c3eda944606b6f3c4e2fa85a2a344c8acc3e0c7168b0fd7629e'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/calver/releases/download/v0.2.0/calver_v0.2.0_linux_amd64.tar.gz'
      sha256 'e77b037376e1b25471a7a245e4eb913435d904c30de7791cce6c306d3b451a59'
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
