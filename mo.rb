class Mo < Formula
  desc 'mo is a Markdown viewer that opens .md files in a browser.'
  version '0.21.0'
  homepage 'https://github.com/k1LoW/mo'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/mo/releases/download/v0.21.0/mo_v0.21.0_darwin_arm64.zip'
      sha256 '296ac4d471f08558852bb9a61e468a75c7ca356cdc7dad705babce51074845d3'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/mo/releases/download/v0.21.0/mo_v0.21.0_darwin_amd64.zip'
      sha256 'ef9ad28383a3ba9e9dc69d7ef122c0ac0b40203bb3b133a69ad6966c1b449cce'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/mo/releases/download/v0.21.0/mo_v0.21.0_linux_arm64.tar.gz'
      sha256 '19f2db55a624b8a210096770c22a0bf5f7245ab0194832efaf5c85582361aca7'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/mo/releases/download/v0.21.0/mo_v0.21.0_linux_amd64.tar.gz'
      sha256 '0c8800985e4d44a3910ca62bfe8a9afd51930f2366e7fc5f21708f34dece5d5c'
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
