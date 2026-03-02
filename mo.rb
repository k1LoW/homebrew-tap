class Mo < Formula
  desc 'mo is a Markdown viewer that opens .md files in a browser.'
  version '0.10.1'
  homepage 'https://github.com/k1LoW/mo'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/mo/releases/download/v0.10.1/mo_v0.10.1_darwin_arm64.zip'
      sha256 '1679955918d5f9321a515073f61b655c94a8cb1e8d9eded94bb88a61c3e80edd'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/mo/releases/download/v0.10.1/mo_v0.10.1_darwin_amd64.zip'
      sha256 'add018fa62bb3d575671e56ae11bd762a542a094c12cfff352f1dbdc861b2595'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/mo/releases/download/v0.10.1/mo_v0.10.1_linux_arm64.tar.gz'
      sha256 'f2e21009f8991a3fd82ec1879e20964955bc852a3c2ae36a4ff65a2c329cf48a'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/mo/releases/download/v0.10.1/mo_v0.10.1_linux_amd64.tar.gz'
      sha256 '0335b2dc31f743ce1ea156adf485a3f80702940d1d03ea1eb42a14ffd95b9518'
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
