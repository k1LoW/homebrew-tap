class Runn < Formula
  desc 'runn is a tool for running operations following a scenario.'
  homepage 'https://github.com/k1LoW/runn'
  version '0.60.0'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/runn/releases/download/v0.60.0/runn_v0.60.0_darwin_arm64.zip'
      sha256 '019bf211e03c513d2363eb4901ce7efa19e0e2c71bcdcb94dd681de6c785ee0d'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.60.0/runn_v0.60.0_darwin_amd64.zip'
      sha256 'bee19bc3c2b201ddd136ce874ec5d483c7d8a2d6f58dd54f3c314fcd861cb1f5'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.60.0/runn_v0.60.0_linux_amd64.tar.gz'
      sha256 '0613dd2be249ec705564eda656c3e4a1d0bcae7681e71cb0714d2170f85d7872'
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
