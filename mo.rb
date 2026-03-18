class Mo < Formula
  desc 'mo is a Markdown viewer that opens .md files in a browser.'
  version '0.19.0'
  homepage 'https://github.com/k1LoW/mo'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/mo/releases/download/v0.19.0/mo_v0.19.0_darwin_arm64.zip'
      sha256 '7222c6e7ca776117739189ac7da59103c3b44080a2e22064ed86d3d34b3be62d'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/mo/releases/download/v0.19.0/mo_v0.19.0_darwin_amd64.zip'
      sha256 '6f40aee276089dcee7dd4fc810740fb962267e620d6f9068ddd08a68a338af0f'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/mo/releases/download/v0.19.0/mo_v0.19.0_linux_arm64.tar.gz'
      sha256 'f300711a038e4883b86d9e1add99d71982cca8d3bb63ddb156f889b9c5b5e229'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/mo/releases/download/v0.19.0/mo_v0.19.0_linux_amd64.tar.gz'
      sha256 'fcc439883e08813efe471e3e833ae1448edbc37becf40c59999268e0099aba83'
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
