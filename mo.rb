class Mo < Formula
  desc 'mo is a Markdown viewer that opens .md files in a browser.'
  version '1.0.0'
  homepage 'https://github.com/k1LoW/mo'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/mo/releases/download/v1.0.0/mo_v1.0.0_darwin_arm64.zip'
      sha256 'c1da0edaaf7ab1b59dca51237da0a796c6fc6d8a092ea6ac6ae91e8f59be731d'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/mo/releases/download/v1.0.0/mo_v1.0.0_darwin_amd64.zip'
      sha256 'f65315d3cdd09c8e68642f068b810a233fe90c84a79da4ca4054d26b271509ed'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/mo/releases/download/v1.0.0/mo_v1.0.0_linux_arm64.tar.gz'
      sha256 '7b35fe337b8cf93fb59e9f53ca503b0117d6a9edee289ba6b8d7659058b72b33'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/mo/releases/download/v1.0.0/mo_v1.0.0_linux_amd64.tar.gz'
      sha256 'e15d5a30b3be089ecab85a962ec31bd25f9064a4041d3739e752852cc915ddc8'
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
