class Mo < Formula
  desc 'mo is a Markdown viewer that opens .md files in a browser.'
  version '1.2.0'
  homepage 'https://github.com/k1LoW/mo'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/mo/releases/download/v1.2.0/mo_v1.2.0_darwin_arm64.zip'
      sha256 '7d3e30ff6a8f4f1301005fe80013a16a6a3606fcf630b8015662c1a7bc07d184'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/mo/releases/download/v1.2.0/mo_v1.2.0_darwin_amd64.zip'
      sha256 '50a567e36da05eefe12520b37183536ed43a0f3c2c7e56da506762e04f6e15fc'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/mo/releases/download/v1.2.0/mo_v1.2.0_linux_arm64.tar.gz'
      sha256 'e1dff3a5c765a819056aa611c6985cd9f9f72d9a89cd40b30ef05da1930cb489'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/mo/releases/download/v1.2.0/mo_v1.2.0_linux_amd64.tar.gz'
      sha256 'b386a7511dbd9d2eebce7fdaf9a3e8926b8b53b727863b50beff5151e05be4f7'
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
