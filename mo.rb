class Mo < Formula
  desc 'mo is a Markdown viewer that opens .md files in a browser.'
  version '1.5.3'
  homepage 'https://github.com/k1LoW/mo'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/mo/releases/download/v1.5.3/mo_v1.5.3_darwin_arm64.zip'
      sha256 '0a10b6fa3392c33662ae85536d1146597a323ba77aff9e341e413020b3c65958'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/mo/releases/download/v1.5.3/mo_v1.5.3_darwin_amd64.zip'
      sha256 'e070a45f5418265abc02fafdbd3712cb56bad7755b82afd2ce87b8202c375769'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/mo/releases/download/v1.5.3/mo_v1.5.3_linux_arm64.tar.gz'
      sha256 '4abeb72d4bfd1142f691c6f98ac8fdaf96934f19cf35b3fdf0842dfe9f2ba0ab'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/mo/releases/download/v1.5.3/mo_v1.5.3_linux_amd64.tar.gz'
      sha256 '8247c159b6ef9d4130c89eaf98125012cc225f280ab813420b32c438712ae0ed'
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
