class Mo < Formula
  desc 'mo is a Markdown viewer that opens .md files in a browser.'
  version '0.2.0'
  homepage 'https://github.com/k1LoW/mo'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/mo/releases/download/v0.2.0/mo_v0.2.0_darwin_arm64.zip'
      sha256 '0daae7c557e4ae6be31c62d5eabe143c28d7197e2b0fddf442258e90b459fb52'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/mo/releases/download/v0.2.0/mo_v0.2.0_darwin_amd64.zip'
      sha256 'ef55e03cee35b5b915cf27de6be1051d687dc04d680c484f941b10c0d785b309'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/mo/releases/download/v0.2.0/mo_v0.2.0_linux_arm64.tar.gz'
      sha256 'dc4edc88655c11bf2b959c421d142fed9849b1afd0b6834734323f95e8475af7'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/mo/releases/download/v0.2.0/mo_v0.2.0_linux_amd64.tar.gz'
      sha256 '6c1763603ceeccf13739a612f4f247b54006712429d3e0d1075683527e697a27'
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
