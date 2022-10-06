class Runn < Formula
  desc 'runn is a tool for running operations following a scenario.'
  homepage 'https://github.com/k1LoW/runn'
  version '0.38.0'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/runn/releases/download/v0.38.0/runn_v0.38.0_darwin_arm64.zip'
      sha256 'b0a9c1a972467a9f00672048a84a470441695b551868f3a3c60e470f4a99d1e9'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.38.0/runn_v0.38.0_darwin_amd64.zip'
      sha256 'eb0a4982647cb05c77f358eff080984bd87239d626d611bf73cf7d4a9711d7c7'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.38.0/runn_v0.38.0_linux_amd64.tar.gz'
      sha256 '82595e140ec70ea5a1d7725e2aa3b97634329b0a2aeb591eef993c715829fc0d'
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
