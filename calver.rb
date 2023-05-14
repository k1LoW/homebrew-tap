class Calver < Formula
  desc 'calver package provides the ability to work with Calendar Versioning in Go.'
  version '0.6.0'
  homepage 'https://github.com/k1LoW/calver'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/calver/releases/download/v0.6.0/calver_v0.6.0_darwin_arm64.zip'
      sha256 '358aba338df046f58bf18dca359ee76b98212ba75b524cf62fa3e09f10c44ead'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/calver/releases/download/v0.6.0/calver_v0.6.0_darwin_amd64.zip'
      sha256 'bcaac08aa5c67ce800ddadd3558e558a99927952f9309dc7929809d25513223a'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/calver/releases/download/v0.6.0/calver_v0.6.0_linux_amd64.tar.gz'
      sha256 '98514d414de86e2320bd07c78d5c51f0931f35191b74e4203a658c1598b4646d'
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
