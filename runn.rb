class Runn < Formula
  desc 'runn is a tool for running operations following a scenario.'
  homepage 'https://github.com/k1LoW/runn'
  version '0.119.0'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/runn/releases/download/v0.119.0/runn_v0.119.0_darwin_arm64.zip'
      sha256 '0bfc7c278ef171323ea4824f9df520fd8756d98f6544ff56472f351d377afa36'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.119.0/runn_v0.119.0_darwin_amd64.zip'
      sha256 'd8ee4d562e30de504348e06ba792c85693b6f66fe20d81561caf5518e3c3d3e1'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.119.0/runn_v0.119.0_linux_amd64.tar.gz'
      sha256 '03537ec2f5ff1f8d67dbbf386212f2d7b7285a02037db6ba6af04af2b297f8aa'
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
