class Runn < Formula
  desc 'runn is a tool for running operations following a scenario.'
  homepage 'https://github.com/k1LoW/runn'
  version '0.63.0'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/runn/releases/download/v0.63.0/runn_v0.63.0_darwin_arm64.zip'
      sha256 '12979d4ba55a94c521219e0722c48db44c92d9662806fe49602bf50967062e0d'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.63.0/runn_v0.63.0_darwin_amd64.zip'
      sha256 '0a01140dd1da1667b2ad5d8946cd5902fd3a28ee7a9604a8061d5e4b2106bbaa'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.63.0/runn_v0.63.0_linux_amd64.tar.gz'
      sha256 '56b904e45b289b6430c94057045c53c23b2ac5ae78c21b5302b1f2b7150c30c0'
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
