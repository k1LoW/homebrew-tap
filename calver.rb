class Calver < Formula
  desc 'calver package provides the ability to work with Calendar Versioning in Go.'
  version '0.7.0'
  homepage 'https://github.com/k1LoW/calver'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/calver/releases/download/v0.7.0/calver_v0.7.0_darwin_arm64.zip'
      sha256 'fcb27b80c380e6e1bd59ac50746573f19b53516915174c905eed019c5721f253'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/calver/releases/download/v0.7.0/calver_v0.7.0_darwin_amd64.zip'
      sha256 '38118067e526c685ba04e1c356d716a3a798a3fb0116059e541667f694e7ba9c'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/calver/releases/download/v0.7.0/calver_v0.7.0_linux_amd64.tar.gz'
      sha256 '778a8fa663b771a20fcfa1140c90951bd1814241f34f2a88e75eaff389a1e57b'
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
