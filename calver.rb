class Calver < Formula
  desc 'calver package provides the ability to work with Calendar Versioning in Go.'
  version '0.7.1'
  homepage 'https://github.com/k1LoW/calver'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/calver/releases/download/v0.7.1/calver_v0.7.1_darwin_arm64.zip'
      sha256 'c10db8e6f2514e3425abc2fa3ea19a6c97c16d4a677673dfc08d33e56f3f440d'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/calver/releases/download/v0.7.1/calver_v0.7.1_darwin_amd64.zip'
      sha256 'a1371ec6d7558c844ac5a492433324344da26ad5d84085cf39672ffda178fb4a'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/calver/releases/download/v0.7.1/calver_v0.7.1_linux_amd64.tar.gz'
      sha256 'cd8f14e9dd91b8c7c2a6b4e7ca25c30110651f3eead3ca336d82bbf21bfbe15b'
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
