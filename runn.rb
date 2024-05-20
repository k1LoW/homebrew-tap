class Runn < Formula
  desc 'runn is a tool for running operations following a scenario.'
  homepage 'https://github.com/k1LoW/runn'
  version '0.108.0'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/runn/releases/download/v0.108.0/runn_v0.108.0_darwin_arm64.zip'
      sha256 '9ce5b2c705fd5cc55346f752b19841eda6f7ee713bd64853ccf45032405bf58a'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.108.0/runn_v0.108.0_darwin_amd64.zip'
      sha256 'eb38db07133e3eb8b5ccc778176f5a0fc178d514c55aa94b207669e5b4657297'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.108.0/runn_v0.108.0_linux_amd64.tar.gz'
      sha256 '385963ff25c0e865e5897e8bcc9df25c896e0aa40da82040bfc453620d3336e5'
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
