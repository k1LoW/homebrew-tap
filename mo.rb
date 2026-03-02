class Mo < Formula
  desc 'mo is a Markdown viewer that opens .md files in a browser.'
  version '0.10.0'
  homepage 'https://github.com/k1LoW/mo'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/mo/releases/download/v0.10.0/mo_v0.10.0_darwin_arm64.zip'
      sha256 '657058d2559a2166d24eae2ee46702c509d8615f0de7c089d1f095f38e08b4cd'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/mo/releases/download/v0.10.0/mo_v0.10.0_darwin_amd64.zip'
      sha256 'd82da7eb6f2a27391fbe88977e33ef5c987a698d4b1ad9714a73b587b9c7bf3e'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/mo/releases/download/v0.10.0/mo_v0.10.0_linux_arm64.tar.gz'
      sha256 'cbd4ec06e873d58a6752788dcac5ccde22196f6147e6e52714e971045e763f56'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/mo/releases/download/v0.10.0/mo_v0.10.0_linux_amd64.tar.gz'
      sha256 '03be0eeff989e61df068aef79491a233f45edc1d7782de3aa83ef431d71c1024'
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
