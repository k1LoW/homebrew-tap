class Runn < Formula
  desc 'runn is a tool for running operations following a scenario.'
  homepage 'https://github.com/k1LoW/runn'
  version '0.63.1'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/runn/releases/download/v0.63.1/runn_v0.63.1_darwin_arm64.zip'
      sha256 'b1a09c747eca4f585ec14baaf720475e7612e455cb5684528baa86cff7e8a255'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.63.1/runn_v0.63.1_darwin_amd64.zip'
      sha256 '55aaf2ce04a93c87896b139cb2271200e291bfc2df28944712e62f64ae5dcb30'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.63.1/runn_v0.63.1_linux_amd64.tar.gz'
      sha256 'de1c45b0a7bd97390c9131be18fc2303bf995474c36d89422b3f15581c96f6cb'
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
