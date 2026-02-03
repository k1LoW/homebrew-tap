class Tcmux < Formula
  desc 'tcmux is a terminal and Claude Code mux viewer.'
  version '0.3.0'
  homepage 'https://github.com/k1LoW/tcmux'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/tcmux/releases/download/v0.3.0/tcmux_v0.3.0_darwin_arm64.zip'
      sha256 '991ee515c758511657151267a7ca008012e6529ceff4ff66b677b287a3fa7aeb'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tcmux/releases/download/v0.3.0/tcmux_v0.3.0_darwin_amd64.zip'
      sha256 '9dcd19fffed646e0ac06b1ba54076b5f7687da6c0d1a90a2a1d4a45b1adab955'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/tcmux/releases/download/v0.3.0/tcmux_v0.3.0_linux_arm64.tar.gz'
      sha256 '8cd2948c29593c113a3582d44a56f8987b1b58f5e66de1118a30ec4ad5a421e4'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tcmux/releases/download/v0.3.0/tcmux_v0.3.0_linux_amd64.tar.gz'
      sha256 'fbe7ef0e5a7d42fa81d81ed004bba566e5ff4e90411cbad8a3cdd801243d2cb4'
    end
  end

  head do
    url 'https://github.com/k1LoW/tcmux.git'
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    bin.install 'tcmux'
  end
end
