class Tmpmod < Formula
  desc 'tmpmod is a tool for temporary use of modified modules.'
  version '0.1.0'
  homepage 'https://github.com/k1LoW/tmpmod'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/tmpmod/releases/download/v0.1.0/tmpmod_v0.1.0_darwin_arm64.zip'
      sha256 '8da077010892f06dbf127894c0e33f4b942dfd25e91e62a992db29fbd00e3408'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tmpmod/releases/download/v0.1.0/tmpmod_v0.1.0_darwin_amd64.zip'
      sha256 '87a326074d7f8a77494d882e8bdabe7148efe5814f6ab63988206107420f9cfa'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/tmpmod/releases/download/v0.1.0/tmpmod_v0.1.0_linux_arm64.tar.gz'
      sha256 'cd8dd423bb3802514691873f71bc102758c1390749ded7eadbb99ecd3a5d67a8'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tmpmod/releases/download/v0.1.0/tmpmod_v0.1.0_linux_amd64.tar.gz'
      sha256 '794b8eda9c303377781067d07f7253f13bb12ddeeaffa907a7b58f03f0c7804f'
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
