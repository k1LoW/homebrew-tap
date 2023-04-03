class Runn < Formula
  desc 'runn is a tool for running operations following a scenario.'
  homepage 'https://github.com/k1LoW/runn'
  version '0.66.0'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/runn/releases/download/v0.66.0/runn_v0.66.0_darwin_arm64.zip'
      sha256 '30db8a06b116ee7144ac4d177c585326f0291a0cd72eec687b19058ffb618e96'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.66.0/runn_v0.66.0_darwin_amd64.zip'
      sha256 '8c004f59e1cb1337d91b92531b2c9b0c69e6fc95bcf8abfdc0002fe10d82b0ef'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.66.0/runn_v0.66.0_linux_amd64.tar.gz'
      sha256 '4fda8efb69e0c31be1f42d1b1063098899b0ff6905483c1dc4cc2ed4fe7d11d2'
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
