class Runn < Formula
  desc 'runn is a tool for running operations following a scenario.'
  homepage 'https://github.com/k1LoW/runn'
  version '0.128.1'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/runn/releases/download/v0.128.1/runn_v0.128.1_darwin_arm64.zip'
      sha256 'b205e21385dc611d3a7bd963ae23e607ca037d8aa8e8e31a98f2e0c2b221431b'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.128.1/runn_v0.128.1_darwin_amd64.zip'
      sha256 'c8860f4441dfaee86fe69a8cec6033711bc218472104fafb006cbc7ad5f358de'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.128.1/runn_v0.128.1_linux_amd64.tar.gz'
      sha256 'd35250cc7d7dd5190b857ba337d337d9e5c6201004f693c1e827c04e288ecb0a'
    end
  end

  head do
    url 'https://github.com/k1LoW/runn.git'
    depends_on 'go' => :build
  end

  def install
    system 'make', 'build' if build.head?
    bin.install 'runn'
    output = Utils.safe_popen_read("#{bin}/runn", 'completion', 'bash')
    (bash_completion/'runn').write output
    output = Utils.safe_popen_read("#{bin}/runn", 'completion', 'zsh')
    (zsh_completion/'_runn').write output
  end
end
