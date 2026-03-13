class Mo < Formula
  desc 'mo is a Markdown viewer that opens .md files in a browser.'
  version '0.18.3'
  homepage 'https://github.com/k1LoW/mo'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/mo/releases/download/v0.18.3/mo_v0.18.3_darwin_arm64.zip'
      sha256 'ec6c87582ff3f720e724f844ddc73426cdc62aee5412323adfb3192969ca277b'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/mo/releases/download/v0.18.3/mo_v0.18.3_darwin_amd64.zip'
      sha256 'a5852fbe6981ac5850e37950cd967fac74bb99873a44dbd36634b942a3abcf01'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/mo/releases/download/v0.18.3/mo_v0.18.3_linux_arm64.tar.gz'
      sha256 '20f2986fe15c4d70dc91ff7f3f5eed52cbcec6abcbf2f5ad30916d8eb4729c5a'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/mo/releases/download/v0.18.3/mo_v0.18.3_linux_amd64.tar.gz'
      sha256 '2febd34389896cce1e045c6e346153995648aa8b6b264e9c5e5915de61502b57'
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
