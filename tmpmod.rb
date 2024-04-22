class Tmpmod < Formula
  desc 'tmpmod is a tool for temporary use of modified modules.'
  version '0.3.0'
  homepage 'https://github.com/k1LoW/tmpmod'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/tmpmod/releases/download/v0.3.0/tmpmod_v0.3.0_darwin_arm64.zip'
      sha256 '08fa5947c6782519c64b403a10703ff2101248a7e0c7843990f68d48d3f553ff'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tmpmod/releases/download/v0.3.0/tmpmod_v0.3.0_darwin_amd64.zip'
      sha256 'f92b2770c8cc991d98b0a277d9d7086274c8c848b9d3f67afbcc8e521d62e674'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/tmpmod/releases/download/v0.3.0/tmpmod_v0.3.0_linux_arm64.tar.gz'
      sha256 '5c707461a8c0dbcb0c8efe55af957045fd68685e635f488f22dbbfc21155a67b'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tmpmod/releases/download/v0.3.0/tmpmod_v0.3.0_linux_amd64.tar.gz'
      sha256 '5711355036753438929aee5a3314cb26a590a50213b7e2eb24f13dd72faa4599'
    end
  end

  head do
    url 'https://github.com/k1LoW/tmpmod.git'
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    bin.install 'tmpmod'
  end
end
