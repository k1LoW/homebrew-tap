class Runn < Formula
  desc 'runn is a tool for running operations following a scenario.'
  homepage 'https://github.com/k1LoW/runn'
  version '0.122.0'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/runn/releases/download/v0.122.0/runn_v0.122.0_darwin_arm64.zip'
      sha256 'ad2d82c0373489324cd553e7a0617c52f452351c8df4ded7a5186016494205fe'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.122.0/runn_v0.122.0_darwin_amd64.zip'
      sha256 'f333c7c69e4d26bca6ae57d4d11c8ec800903339b6c7e6eb6f51b43c94bf427a'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.122.0/runn_v0.122.0_linux_amd64.tar.gz'
      sha256 'ad1de68ac64097ea234bbdc1ba9b38cff6534970ffa9b57d4d7f96fd1c42b125'
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
