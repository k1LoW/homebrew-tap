class Dirtop < Formula
  desc 'List per-directory CPU and memory usage of running processes'
  version '0.1.1'
  homepage 'https://github.com/k1LoW/dirtop'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/dirtop/releases/download/v0.1.1/dirtop_v0.1.1_darwin_arm64.zip'
      sha256 '840e5f38303ad73d9ad34354693ddeba1e1ef8c1e8ca1019ce073828f2c7c529'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/dirtop/releases/download/v0.1.1/dirtop_v0.1.1_darwin_amd64.zip'
      sha256 '46d7bd5c6bdf0545fd438631e4354c3a88003828c8f38b80748d5e5e064638a0'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/dirtop/releases/download/v0.1.1/dirtop_v0.1.1_linux_arm64.tar.gz'
      sha256 '0b9de281dec77b3b1425c70aa831817f173cc633125a85d6ca54e554b88af68a'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/dirtop/releases/download/v0.1.1/dirtop_v0.1.1_linux_amd64.tar.gz'
      sha256 '9182d86becbbbb9df19118898eec344fddd1aa666f16e4c4ac9a4188b24243ca'
    end
  end

  head do
    url 'https://github.com/k1LoW/dirtop.git'
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    bin.install 'dirtop'
  end
end
