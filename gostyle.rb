class Gostyle < Formula
  version '0.18.2'
  homepage 'https://github.com/k1LoW/gostyle'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/gostyle/releases/download/v0.18.2/gostyle_v0.18.2_darwin_arm64.zip'
      sha256 'cee6e7f92db6e7a0ab01c6e778f1bd14d5ddd332f61e611d7f1167289abe3776'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/gostyle/releases/download/v0.18.2/gostyle_v0.18.2_darwin_amd64.zip'
      sha256 '895a2438a5105af7ac457fb135425d6a7135b0b6391e3e319c9ae3df95f8950a'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/gostyle/releases/download/v0.18.2/gostyle_v0.18.2_linux_arm64.tar.gz'
      sha256 '30fad29359677acad2ea456e6c7df33c46accaea305c5af846833ef97ce45f88'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/gostyle/releases/download/v0.18.2/gostyle_v0.18.2_linux_amd64.tar.gz'
      sha256 '6afd4e7e23c4b8b98d27d108dc0ce7b27b144d6ee7b3f42aeae6a1bdaa024980'
    end
  end

  head do
    url 'https://github.com/k1LoW/gostyle.git'
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    bin.install 'gostyle'
  end
end
