class Calver < Formula
  desc 'calver package provides the ability to work with Calendar Versioning in Go.'
  version '0.7.2'
  homepage 'https://github.com/k1LoW/calver'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/calver/releases/download/v0.7.2/calver_v0.7.2_darwin_arm64.zip'
      sha256 'fa0f349799c701d18b266d771e5d98282c06cecd9e121d145a225b30800f4cce'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/calver/releases/download/v0.7.2/calver_v0.7.2_darwin_amd64.zip'
      sha256 'ab3a50aa6cf00c2f1d8ed758979ca82d168a921cc21f627aa7bfa4a9f4fa8631'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/calver/releases/download/v0.7.2/calver_v0.7.2_linux_amd64.tar.gz'
      sha256 '33f03f6afaf7af97bb7e58d7a8f92ca3922ac3bd4d546541f5c4c217206cff6e'
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
