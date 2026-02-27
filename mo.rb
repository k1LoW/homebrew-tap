class Mo < Formula
  desc 'mo is a Markdown viewer that opens .md files in a browser.'
  version '0.1.0'
  homepage 'https://github.com/k1LoW/mo'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/mo/releases/download/v0.1.0/mo_v0.1.0_darwin_arm64.zip'
      sha256 '435f7bedbd834ee4a8105d8d05163614a55c0f5b36b8f73d14d556596239a9af'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/mo/releases/download/v0.1.0/mo_v0.1.0_darwin_amd64.zip'
      sha256 '3e4d7b4d72a69bc99e0ae64b3aabab63c417cadac84e4b2e42f10d6109f3a638'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/mo/releases/download/v0.1.0/mo_v0.1.0_linux_arm64.tar.gz'
      sha256 '7e84ad4b5a212a902feda01727de03f1a1dbdfb4cfaa959bc64cdb2e632f4036'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/mo/releases/download/v0.1.0/mo_v0.1.0_linux_amd64.tar.gz'
      sha256 '8087f27234d72e0e3431829fb9701aeee47f24b0f139ec482e18ffa9cfde5ead'
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
