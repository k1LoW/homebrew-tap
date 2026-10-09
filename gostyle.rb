class Gostyle < Formula
  version '0.26.2'
  homepage 'https://github.com/k1LoW/gostyle'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/gostyle/releases/download/v0.26.2/gostyle_v0.26.2_darwin_arm64.zip'
      sha256 'd5f814c1d0f02d319836d13a50826afaf99ffea98622561472ac12ab2f944a6f'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/gostyle/releases/download/v0.26.2/gostyle_v0.26.2_darwin_amd64.zip'
      sha256 '58ffd84fa363f61c24a0786471b7bdfd4d0a73bf54e8f5db662b47b19d01531c'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/gostyle/releases/download/v0.26.2/gostyle_v0.26.2_linux_arm64.tar.gz'
      sha256 '8a25bd4f03804223a3d78d7af3ff2bf6278a744ce401aa8dec52ed86d7822104'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/gostyle/releases/download/v0.26.2/gostyle_v0.26.2_linux_amd64.tar.gz'
      sha256 'e28cd77ad009ac6082770de90da553dd8fb495a2816fe4592949a6a8e879ee2d'
    end
  end

  head do
    url 'https://github.com/k1LoW/gostyle.git'
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    bin.install 'gostyle'
  end
end
