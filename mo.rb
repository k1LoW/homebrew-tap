class Mo < Formula
  desc 'mo is a Markdown viewer that opens .md files in a browser.'
  version '0.20.2'
  homepage 'https://github.com/k1LoW/mo'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/mo/releases/download/v0.20.2/mo_v0.20.2_darwin_arm64.zip'
      sha256 'c23cdb9d14b06414ddccebd91feb1cd63672fe76c28c9c8bdba801e018d5c0d2'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/mo/releases/download/v0.20.2/mo_v0.20.2_darwin_amd64.zip'
      sha256 '8a8214ab8f6e0a575565b9cca2a04abe7b4ff9eb9a8e454f6a7d0cfb9321867a'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/mo/releases/download/v0.20.2/mo_v0.20.2_linux_arm64.tar.gz'
      sha256 'db1aad0a9a2075b8f491341804d9292cb220b06f78193a0064e894587d68eb80'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/mo/releases/download/v0.20.2/mo_v0.20.2_linux_amd64.tar.gz'
      sha256 '9dc0e0545db16473ee9992c4fe4417b7091fa0e6c2f3778f705087ad949a9f6d'
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
