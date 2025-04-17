class Tmpmod < Formula
  desc 'tmpmod is a tool for temporary use of modified modules.'
  version '0.4.2'
  homepage 'https://github.com/k1LoW/tmpmod'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/tmpmod/releases/download/v0.4.2/tmpmod_v0.4.2_darwin_arm64.zip'
      sha256 '97618e5870255d014f3e835b1e58762a3c876c89f53eb34933bccd8c4fc3de65'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tmpmod/releases/download/v0.4.2/tmpmod_v0.4.2_darwin_amd64.zip'
      sha256 '46a45e5d99fc781728d69a857256bd5f2a8de0344952d68c095cb38171893354'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/tmpmod/releases/download/v0.4.2/tmpmod_v0.4.2_linux_arm64.tar.gz'
      sha256 '3356576c7e619264ee5d38c1e9572d6f3a186a44c715972a5d92ab249f2d6f8d'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tmpmod/releases/download/v0.4.2/tmpmod_v0.4.2_linux_amd64.tar.gz'
      sha256 '70b09d435e85fc3b6143afe943d7e77a2c0f0710bb7592cd5770b34d75d86a29'
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
