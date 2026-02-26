class Tmpmod < Formula
  desc 'tmpmod is a tool for temporary use of modified modules.'
  version '0.4.4'
  homepage 'https://github.com/k1LoW/tmpmod'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/tmpmod/releases/download/v0.4.4/tmpmod_v0.4.4_darwin_arm64.zip'
      sha256 '910d40231a769fad23a18848b93f6774c1ed565b3665067cc161ee8842150c2b'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tmpmod/releases/download/v0.4.4/tmpmod_v0.4.4_darwin_amd64.zip'
      sha256 '666a16feb51c080c2d9b57725afb30217d85d7e9529f9a7757dd1da7e9c64649'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/tmpmod/releases/download/v0.4.4/tmpmod_v0.4.4_linux_arm64.tar.gz'
      sha256 'e934a326d9567d79d431974fedca091db21e32e74a2fa38bbfe461fa1dce27a8'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tmpmod/releases/download/v0.4.4/tmpmod_v0.4.4_linux_amd64.tar.gz'
      sha256 'a7883a73ac6e3058332e6cddc5de47f9918084efe00a0528cd98be024c27561d'
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
