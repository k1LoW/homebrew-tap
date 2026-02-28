class Mo < Formula
  desc 'mo is a Markdown viewer that opens .md files in a browser.'
  version '0.3.2'
  homepage 'https://github.com/k1LoW/mo'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/mo/releases/download/v0.3.2/mo_v0.3.2_darwin_arm64.zip'
      sha256 'fd7ae1cf3ddf170fb8743d088af37f23a05c547f5e8b764f227e003dbe0f668f'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/mo/releases/download/v0.3.2/mo_v0.3.2_darwin_amd64.zip'
      sha256 'ae31cc343008981cf76a57f601c0e780397a84f587b8f13ff679b4f5983fc8b2'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/mo/releases/download/v0.3.2/mo_v0.3.2_linux_arm64.tar.gz'
      sha256 '56ccb50eca4a3a2b1cd83471656e22e574d5fb406cdd11fca7b2b33369d4ece7'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/mo/releases/download/v0.3.2/mo_v0.3.2_linux_amd64.tar.gz'
      sha256 'c3bb6697ee9763bf1e43946bcaccf54b21c86a10ed2eb582175fdd7ebc31e0ec'
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
