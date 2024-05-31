class Runn < Formula
  desc 'runn is a tool for running operations following a scenario.'
  homepage 'https://github.com/k1LoW/runn'
  version '0.110.1'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/runn/releases/download/v0.110.1/runn_v0.110.1_darwin_arm64.zip'
      sha256 '57e5746f37b802143b6c9c8208efa368af39a9a49e4f1dd7a657ad848f36d59d'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.110.1/runn_v0.110.1_darwin_amd64.zip'
      sha256 '3bc0b45661e673a4de577a94a1a47fbebfd2c94dcdbc89dbbf77c2034b61ab6d'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.110.1/runn_v0.110.1_linux_amd64.tar.gz'
      sha256 'e467448a10a50885ce4e77715d1d31ab1159cef1f8626aef597f7e4c2304d475'
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
