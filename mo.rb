class Mo < Formula
  desc 'mo is a Markdown viewer that opens .md files in a browser.'
  version '0.23.1'
  homepage 'https://github.com/k1LoW/mo'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/mo/releases/download/v0.23.1/mo_v0.23.1_darwin_arm64.zip'
      sha256 '42e9a3e6351325a86531b21719a18a07fc4ab00ecdb468480048874b9d15139f'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/mo/releases/download/v0.23.1/mo_v0.23.1_darwin_amd64.zip'
      sha256 '9b1b9010c8c6e3fa30466b89109ee09704f99b1885e7603cd7f80c47fadd6b7b'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/mo/releases/download/v0.23.1/mo_v0.23.1_linux_arm64.tar.gz'
      sha256 '5df0d291b81dd3a5cd00ac3de6fe813c42e17ccb03f5975fa147ec1bcea43052'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/mo/releases/download/v0.23.1/mo_v0.23.1_linux_amd64.tar.gz'
      sha256 '8b5bf3f5881086eb1939652dd49b2b610b668f615939c6edd444111a03f0e3ec'
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
