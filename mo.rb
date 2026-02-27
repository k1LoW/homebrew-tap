class Mo < Formula
  desc 'mo is a Markdown viewer that opens .md files in a browser.'
  version '0.3.0'
  homepage 'https://github.com/k1LoW/mo'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/mo/releases/download/v0.3.0/mo_v0.3.0_darwin_arm64.zip'
      sha256 'fcd34f9c2ca1aabe4a6126992e8e23b05c07d38742a3bf7d163bf7b961329e03'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/mo/releases/download/v0.3.0/mo_v0.3.0_darwin_amd64.zip'
      sha256 'fed5fffa6c70acd7e84dc33e93982d1c0a08de813009db95a9947a0e36d36670'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/mo/releases/download/v0.3.0/mo_v0.3.0_linux_arm64.tar.gz'
      sha256 'f8206407662aa8af8ed1eb8cc81873849024561c6e21ccd04a22e67b98d4c8ac'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/mo/releases/download/v0.3.0/mo_v0.3.0_linux_amd64.tar.gz'
      sha256 '845978a8ba5a879aebbc2a4f52af7cccf0c87b6bae84045795cedc509a639137'
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
