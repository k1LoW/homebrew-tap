class Calver < Formula
  desc 'calver package provides the ability to work with Calendar Versioning in Go.'
  version '0.5.0'
  homepage 'https://github.com/k1LoW/calver'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/calver/releases/download/v0.5.0/calver_v0.5.0_darwin_arm64.zip'
      sha256 'f2a9391bf75574460c6ed49a86b7cebc5127d843231732fcb6638a1207032562'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/calver/releases/download/v0.5.0/calver_v0.5.0_darwin_amd64.zip'
      sha256 '907e8d310fa280e63a9e54d6bd711dc1e6b3a3da1b73daf6701f931819edfae8'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/calver/releases/download/v0.5.0/calver_v0.5.0_linux_amd64.tar.gz'
      sha256 'c9f701f6f73b95e2761841b56e6566355da0a6b093799e97824990cb2a830c2b'
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
