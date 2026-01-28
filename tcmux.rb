class Tcmux < Formula
  desc 'tcmux is a terminal and Claude Code mux viewer.'
  version '0.1.0'
  homepage 'https://github.com/k1LoW/tcmux'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/tcmux/releases/download/v0.1.0/tcmux_v0.1.0_darwin_arm64.zip'
      sha256 '7981a0102b6aee911561b6bd53043ecf8ab86ab0cf3e00b7e4f9fa24aa8b82d8'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tcmux/releases/download/v0.1.0/tcmux_v0.1.0_darwin_amd64.zip'
      sha256 '39f605493a890157dde16b80538eb1aceb630a779039952d4d9fa34e03034117'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/tcmux/releases/download/v0.1.0/tcmux_v0.1.0_linux_arm64.tar.gz'
      sha256 '6043b2257f2754092f66858a5705c414e3229f4f8086e042d1673b3a7db82a09'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tcmux/releases/download/v0.1.0/tcmux_v0.1.0_linux_amd64.tar.gz'
      sha256 '6bbd84655f8b0139bec5f3d6f918c515eca067b38a7b72b33d5c25652a43c727'
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
