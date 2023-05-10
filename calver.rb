class Calver < Formula
  desc 'calver package provides the ability to work with Calendar Versioning in Go.'
  version '0.4.0'
  homepage 'https://github.com/k1LoW/calver'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/calver/releases/download/v0.4.0/calver_v0.4.0_darwin_arm64.zip'
      sha256 '27727f2e4b41d1c70b7d574de370a36da8b1dfd92b2019e8b450a520ce909d51'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/calver/releases/download/v0.4.0/calver_v0.4.0_darwin_amd64.zip'
      sha256 '63fc08647d401977fc067bee63f9c278bb70eb1bfc1e02132750b85b7a53e71b'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/calver/releases/download/v0.4.0/calver_v0.4.0_linux_amd64.tar.gz'
      sha256 'ae3fd771495a2a5ab7e8fb7a9b170d619c7d59d88c72eb43062f589346c8456a'
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
