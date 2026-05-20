class Calver < Formula
  desc 'calver package provides the ability to work with Calendar Versioning in Go.'
  version '1.0.2'
  homepage 'https://github.com/k1LoW/calver'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/calver/releases/download/v1.0.2/calver_v1.0.2_darwin_arm64.zip'
      sha256 'a83415999816cbac89b3b7d6e360a955bf54d7fbbed946f00e3232e2ed8bfff8'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/calver/releases/download/v1.0.2/calver_v1.0.2_darwin_amd64.zip'
      sha256 '22d7f7d65e770e1ea2dfd45443c39ed520d9a4b81d7482c7fe96c6f7d4be792d'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/calver/releases/download/v1.0.2/calver_v1.0.2_linux_amd64.tar.gz'
      sha256 '04ce9549b211d61326723e05c071c4ad0a51c15c88570d3c807b81719bf63ad5'
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
