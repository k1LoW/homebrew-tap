class Mo < Formula
  desc 'mo is a Markdown viewer that opens .md files in a browser.'
  version '1.6.0'
  homepage 'https://github.com/k1LoW/mo'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/mo/releases/download/v1.6.0/mo_v1.6.0_darwin_arm64.zip'
      sha256 '34c504ea22b26749b1e7320da320b9da58c0bc57ec46ece929c55664a48f7d3d'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/mo/releases/download/v1.6.0/mo_v1.6.0_darwin_amd64.zip'
      sha256 '3c2b6f677f788b3464ca857da1f00a4c238b3fd5d90a6afd17861dfe690ad135'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/mo/releases/download/v1.6.0/mo_v1.6.0_linux_arm64.tar.gz'
      sha256 'e140dea774c3e52a75a819966942ac3ae184a33a3c64edaf0b9f2a2dcc2c7ead'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/mo/releases/download/v1.6.0/mo_v1.6.0_linux_amd64.tar.gz'
      sha256 'ac8e86207a6e1fac90bd96e2c3afcf1766b809ee7abdc0b5d5fda0b5e30881f0'
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
    generate_completions_from_executable(bin/'mo', 'completion')
  end
end
