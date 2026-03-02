class Mo < Formula
  desc 'mo is a Markdown viewer that opens .md files in a browser.'
  version '0.9.0'
  homepage 'https://github.com/k1LoW/mo'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/mo/releases/download/v0.9.0/mo_v0.9.0_darwin_arm64.zip'
      sha256 'e84077d9e7ac552d21ba09b58092739884e9d44f40b76b85eb628113df5fcb42'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/mo/releases/download/v0.9.0/mo_v0.9.0_darwin_amd64.zip'
      sha256 'a70d988c9aa6f690e235b56e0c026a0d26b8d50125ffa98f5cf7854f97bfb278'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/mo/releases/download/v0.9.0/mo_v0.9.0_linux_arm64.tar.gz'
      sha256 '5d7b5306663906d3ed458de1ca3dae18eb24ce428865e5206884bb0b671095e0'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/mo/releases/download/v0.9.0/mo_v0.9.0_linux_amd64.tar.gz'
      sha256 '7bc7e1717316fef7226416d2b6acc4d93ded951c5f3ca728b0ae1753de50914a'
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
