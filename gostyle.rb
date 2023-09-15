class Gostyle < Formula
  version '0.10.3'
  homepage 'https://github.com/k1LoW/gostyle'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/gostyle/releases/download/v0.10.3/gostyle_v0.10.3_darwin_arm64.zip'
      sha256 '66b46dc379df26ad3abe0633843d03177c67838e8985dd197d0059095f798548'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/gostyle/releases/download/v0.10.3/gostyle_v0.10.3_darwin_amd64.zip'
      sha256 'cf76c15a2970027f314581a3f44cdb5c38da62fb469213d190f541420604ed60'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/gostyle/releases/download/v0.10.3/gostyle_v0.10.3_linux_arm64.tar.gz'
      sha256 'b59054eef3eb6d36b2e7e1132bc192af805254751e0c2cadbc7464b31c41374f'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/gostyle/releases/download/v0.10.3/gostyle_v0.10.3_linux_amd64.tar.gz'
      sha256 'a0c5cf988c104571bd5afc3e5504025c4b8325469bd62758595108ee17d34e60'
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
