class Runn < Formula
  desc 'runn is a tool for running operations following a scenario.'
  homepage 'https://github.com/k1LoW/runn'
  version '0.130.0'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/runn/releases/download/v0.130.0/runn_v0.130.0_darwin_arm64.zip'
      sha256 '10c8a0976d80d6b475e19f2f0895714fff7db77d772e3f96ee5991c9c0789795'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.130.0/runn_v0.130.0_darwin_amd64.zip'
      sha256 '90d922b5a7a09990969e3a67c09810553399a31bc41253b9d3a303d29195258d'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.130.0/runn_v0.130.0_linux_amd64.tar.gz'
      sha256 '469129d291992575045bb99f03e14ccf3a121a8d2bccb60f09b3b146ca9cb0bf'
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
