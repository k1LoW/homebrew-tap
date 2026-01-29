class Calver < Formula
  desc 'calver package provides the ability to work with Calendar Versioning in Go.'
  version '1.0.1'
  homepage 'https://github.com/k1LoW/calver'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/calver/releases/download/v1.0.1/calver_v1.0.1_darwin_arm64.zip'
      sha256 '1505b96c0aa6a4d7bc1c598bff899ffa4f1b85cf0828fea8eca30b1a1a960d08'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/calver/releases/download/v1.0.1/calver_v1.0.1_darwin_amd64.zip'
      sha256 '16f7872f844f08e4f9f0d29979104e38cbf081bedf192edef5f3df5bd1b9ee8b'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/calver/releases/download/v1.0.1/calver_v1.0.1_linux_amd64.tar.gz'
      sha256 '1112ab8f0058fb2c8f0e211b0d666255b48e9bad90027b2fca1de5ec308851c9'
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
