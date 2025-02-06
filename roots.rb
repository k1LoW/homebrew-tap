class Roots < Formula
  version '0.2.0'
  homepage 'https://github.com/k1LoW/roots'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/roots/releases/download/v0.2.0/roots_v0.2.0_darwin_arm64.zip'
      sha256 '6e18097e3643e41cbd711493eda31dfdceff85502afd71e638c6551f2bec5da7'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/roots/releases/download/v0.2.0/roots_v0.2.0_darwin_amd64.zip'
      sha256 'ea69c36ecc05f2d049be7f74aac0e880d1b61b0965cdb120aaceba8c7fc441f2'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/roots/releases/download/v0.2.0/roots_v0.2.0_linux_arm64.tar.gz'
      sha256 '8653dbe064f145e749981499d3a141177a4b0fde108154efe15289252eb2f5ca'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/roots/releases/download/v0.2.0/roots_v0.2.0_linux_amd64.tar.gz'
      sha256 'd56f757e8ac47193f528fee8ddca63ddf090ab07de47a2b269ab900e3728e3d0'
    end
  end

  head do
    url 'https://github.com/k1LoW/roots.git'
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    bin.install 'roots'
  end
end
