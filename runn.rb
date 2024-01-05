class Runn < Formula
  desc 'runn is a tool for running operations following a scenario.'
  homepage 'https://github.com/k1LoW/runn'
  version '0.93.0'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/runn/releases/download/v0.93.0/runn_v0.93.0_darwin_arm64.zip'
      sha256 '321dc829da185bda56efe484e76ba5292695d6cd429ce49cbf0939d4ba2931d4'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.93.0/runn_v0.93.0_darwin_amd64.zip'
      sha256 '1def6d0a5a025ad419ccfb3dbead3469454706fb9f2e6c8fe98d89856b66fadb'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.93.0/runn_v0.93.0_linux_amd64.tar.gz'
      sha256 '47eac6c4687ea2c695c94c0a27332890135215104b9a7dae44a53edbc9163711'
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
