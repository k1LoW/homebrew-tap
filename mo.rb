class Mo < Formula
  desc 'mo is a Markdown viewer that opens .md files in a browser.'
  version '0.6.0'
  homepage 'https://github.com/k1LoW/mo'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/mo/releases/download/v0.6.0/mo_v0.6.0_darwin_arm64.zip'
      sha256 '024fb86e688fa9fec8951b8d54e5d337544d88fb449c14a096de3554eb21c781'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/mo/releases/download/v0.6.0/mo_v0.6.0_darwin_amd64.zip'
      sha256 'f2485f6d5bd55ee614003f70d2818f6aaedc69aa2748dfb2d3070fc8eb92f4ff'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/mo/releases/download/v0.6.0/mo_v0.6.0_linux_arm64.tar.gz'
      sha256 '5a6e97216d448c25e0ac4baf861743053cd677a669f0f50eec3d290884cac5d7'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/mo/releases/download/v0.6.0/mo_v0.6.0_linux_amd64.tar.gz'
      sha256 'f89b5851e51695727a1adac54556aa428fd65c24b67a8c154749dcea5a4eea2a'
    end
  end

  head do
    url 'https://github.com/k1LoW/mo.git'
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    bin.install 'mo'
  end
end
