class Tcmux < Formula
  desc 'tcmux is a terminal and Claude Code mux viewer.'
  version '0.2.1'
  homepage 'https://github.com/k1LoW/tcmux'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/tcmux/releases/download/v0.2.1/tcmux_v0.2.1_darwin_arm64.zip'
      sha256 '47d1dc646b5c9864547780b7e7d1fe11b72b0622f5817ddd2d9ea8ba1aee5d53'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tcmux/releases/download/v0.2.1/tcmux_v0.2.1_darwin_amd64.zip'
      sha256 '281108b86ab6169578261a48ecc874c34116bc2e34b51c40194597316045b6e8'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/tcmux/releases/download/v0.2.1/tcmux_v0.2.1_linux_arm64.tar.gz'
      sha256 '533b40ed1ccf0d36f564bfe09fdc7d434a44fc81c7585c10da60300d31ff90f6'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tcmux/releases/download/v0.2.1/tcmux_v0.2.1_linux_amd64.tar.gz'
      sha256 'e44330829cb36b3debcbbf36ecca2900d2c1d6991fdedd392a342b65ef5a2940'
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
