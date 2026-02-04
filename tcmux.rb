class Tcmux < Formula
  desc 'tcmux is a terminal and Claude Code mux viewer.'
  version '0.3.1'
  homepage 'https://github.com/k1LoW/tcmux'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/tcmux/releases/download/v0.3.1/tcmux_v0.3.1_darwin_arm64.zip'
      sha256 'a64e63d5440433b9c51b1f5c9fdf600a6985f0b096459888b47d452cd94dab4e'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tcmux/releases/download/v0.3.1/tcmux_v0.3.1_darwin_amd64.zip'
      sha256 '3b7250b7e441aab22627c12290e25f07358b9955d621ce728698eb1e365cebe0'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/tcmux/releases/download/v0.3.1/tcmux_v0.3.1_linux_arm64.tar.gz'
      sha256 '6d5f44ecc7fa91cfcde28f5499640124b0db37ec0e2c3980e8ba7efc5842697f'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tcmux/releases/download/v0.3.1/tcmux_v0.3.1_linux_amd64.tar.gz'
      sha256 '2cd68dad7424011d84bab10b888fd73c57d48e91cfacada37e798b355a84a4e4'
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
