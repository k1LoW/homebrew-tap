class Calver < Formula
  desc 'calver package provides the ability to work with Calendar Versioning in Go.'
  version '0.5.1'
  homepage 'https://github.com/k1LoW/calver'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/calver/releases/download/v0.5.1/calver_v0.5.1_darwin_arm64.zip'
      sha256 '1aa949abe9ef52a63efca36bd8b406e60c3b3ee913a7cf7d22cac5c9a249f283'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/calver/releases/download/v0.5.1/calver_v0.5.1_darwin_amd64.zip'
      sha256 'a649c4c447c4e5f2cf4a95277c6e16c240f350b2d9a781ccfbac69b6083e3fca'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/calver/releases/download/v0.5.1/calver_v0.5.1_linux_amd64.tar.gz'
      sha256 '49640ac0ca280f712a1e25bd7ad20db636e078a8416a7ed0d33fa056f305f5c7'
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
