class Mo < Formula
  desc 'mo is a Markdown viewer that opens .md files in a browser.'
  version '0.11.0'
  homepage 'https://github.com/k1LoW/mo'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/mo/releases/download/v0.11.0/mo_v0.11.0_darwin_arm64.zip'
      sha256 'e4ad52f8f856e534cc64fa6c46cc8121bc851d8920e29b6c272a71d7c9c81318'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/mo/releases/download/v0.11.0/mo_v0.11.0_darwin_amd64.zip'
      sha256 'f293475d6ba308fe7809e0cdec5abe19d0b13051de045cf7fbf88c7d09a840fd'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/mo/releases/download/v0.11.0/mo_v0.11.0_linux_arm64.tar.gz'
      sha256 'de8678fd4d9565733fc1ba7d4bff6c39a29558a83cedec78d1a68599fa1e3cbb'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/mo/releases/download/v0.11.0/mo_v0.11.0_linux_amd64.tar.gz'
      sha256 '522e6871420b5419df10f524a009cd4983b3d38447a47e8f5b651a868d74391a'
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
