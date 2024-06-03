class Calver < Formula
  desc 'calver package provides the ability to work with Calendar Versioning in Go.'
  version '0.7.3'
  homepage 'https://github.com/k1LoW/calver'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/calver/releases/download/v0.7.3/calver_v0.7.3_darwin_arm64.zip'
      sha256 '7b52d026aceedafd629454679597f3ac0158216eaf0e08f977ce8175c5130829'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/calver/releases/download/v0.7.3/calver_v0.7.3_darwin_amd64.zip'
      sha256 '1ad2bf5f2456fadc987cb8c202d602a7313e2780b275ae5a3a44482912b193b0'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/calver/releases/download/v0.7.3/calver_v0.7.3_linux_amd64.tar.gz'
      sha256 '0f78b59559a79d4d08110f51b7ffc1d62da8bce347723827076108c001b31a3e'
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
