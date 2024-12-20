class Runn < Formula
  desc 'runn is a tool for running operations following a scenario.'
  homepage 'https://github.com/k1LoW/runn'
  version '0.125.0'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/runn/releases/download/v0.125.0/runn_v0.125.0_darwin_arm64.zip'
      sha256 '60cd9e954dc50525f427992a4fe4610106079e3b82c76dc564fe6374d3c4625d'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.125.0/runn_v0.125.0_darwin_amd64.zip'
      sha256 '7c648ff55b441f4ae8235014875e2ff8a9dc8254bfa20c88e2bfd288154d0b4f'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.125.0/runn_v0.125.0_linux_amd64.tar.gz'
      sha256 '7d60decfa47d14ad6ad70ca3e9b635c1d569efa6246cead673b1798fe16f954b'
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
