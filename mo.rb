class Mo < Formula
  desc 'mo is a Markdown viewer that opens .md files in a browser.'
  version '0.5.1'
  homepage 'https://github.com/k1LoW/mo'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/mo/releases/download/v0.5.1/mo_v0.5.1_darwin_arm64.zip'
      sha256 '52131c6df1d80b2aae81ee1708b7359253f0a4114b4dfe5895a0239ba9ebc013'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/mo/releases/download/v0.5.1/mo_v0.5.1_darwin_amd64.zip'
      sha256 'ecc122ea53f9cd3e78ac5f367bee07c4024c2100ee41acb0b1e053d5c64b63c2'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/mo/releases/download/v0.5.1/mo_v0.5.1_linux_arm64.tar.gz'
      sha256 'd3a3d474578331813cf59d74c25edf5353570c6f846623f97642369d33251dbd'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/mo/releases/download/v0.5.1/mo_v0.5.1_linux_amd64.tar.gz'
      sha256 '51e990432fad3e3caa9058c667b6751b76fa3a3d99f2ca79890d7f2f90b6007d'
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
