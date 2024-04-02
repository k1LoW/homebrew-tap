class Gostyle < Formula
  version '0.19.0'
  homepage 'https://github.com/k1LoW/gostyle'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/gostyle/releases/download/v0.19.0/gostyle_v0.19.0_darwin_arm64.zip'
      sha256 'c3b284b160d3c41268e0358a8fa96bd57ca252807a7908ecd2d12bec2c6a68de'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/gostyle/releases/download/v0.19.0/gostyle_v0.19.0_darwin_amd64.zip'
      sha256 '93f74924ed9f6649c4c4ed7dd0bbc534ed9a9eb6c1e79d125d615e1ca7136255'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/gostyle/releases/download/v0.19.0/gostyle_v0.19.0_linux_arm64.tar.gz'
      sha256 '700313fe7beb7914438156e9782144b592aad3b6e383d126d9b5202288ad7938'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/gostyle/releases/download/v0.19.0/gostyle_v0.19.0_linux_amd64.tar.gz'
      sha256 'd281258be38d14f833dc6fa3da52bee5e56759da95db3f8d1a1fa791f02823a4'
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
