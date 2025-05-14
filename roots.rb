class Roots < Formula
  version '0.3.1'
  homepage 'https://github.com/k1LoW/roots'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/roots/releases/download/v0.3.1/roots_v0.3.1_darwin_arm64.zip'
      sha256 'fb202f42f52314a5e0f0394331bcab40f31168f95524fa06181c4b5d2794b823'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/roots/releases/download/v0.3.1/roots_v0.3.1_darwin_amd64.zip'
      sha256 '6b55b5e230bbc0af61ef8c512e8d464ca0c86a2b202bd7112678855aca9a68b8'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/roots/releases/download/v0.3.1/roots_v0.3.1_linux_arm64.tar.gz'
      sha256 'ef5560f932e33edd79a4c77ccc39f85a6edc2ec0a7737e532dcafc9aa8607969'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/roots/releases/download/v0.3.1/roots_v0.3.1_linux_amd64.tar.gz'
      sha256 '75b317b6f0fe00781a4af3b40fe5e4e28efa9b41edaf14de369f0a9870de4dc7'
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
