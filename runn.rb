class Runn < Formula
  desc 'runn is a tool for running operations following a scenario.'
  homepage 'https://github.com/k1LoW/runn'
  version '0.69.1'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/runn/releases/download/v0.69.1/runn_v0.69.1_darwin_arm64.zip'
      sha256 'c4896119bbed4f0cd23ee968538598ef1048e01f7c115698f528a9fdc3342b00'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.69.1/runn_v0.69.1_darwin_amd64.zip'
      sha256 '733ed15443b12275ede97e9c4e2278f89574ac51d2b8d7489eeee4ed99ff6009'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.69.1/runn_v0.69.1_linux_amd64.tar.gz'
      sha256 'b367ff10a227d55479e828ab402c930276ea93fd2071fc0892dccfb680a159a6'
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
