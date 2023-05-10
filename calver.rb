class Calver < Formula
  desc 'calver package provides the ability to work with Calendar Versioning in Go.'
  version '0.3.0'
  homepage 'https://github.com/k1LoW/calver'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/calver/releases/download/v0.3.0/calver_v0.3.0_darwin_arm64.zip'
      sha256 'f41dd7d15aa4c4d6838c65b4b1894dfcdae4eac3f00d86a4b35dd255bc0134f3'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/calver/releases/download/v0.3.0/calver_v0.3.0_darwin_amd64.zip'
      sha256 'da97ade038f669757145cd46b46f969d2b81119771000cfe521bc284676d735f'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/calver/releases/download/v0.3.0/calver_v0.3.0_linux_amd64.tar.gz'
      sha256 'ee817628fc90145943678434a7d8848ea95c293b28408bc69bf7584d36746987'
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
