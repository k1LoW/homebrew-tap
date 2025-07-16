class Runn < Formula
  desc 'runn is a tool for running operations following a scenario.'
  homepage 'https://github.com/k1LoW/runn'
  version '0.133.0'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/runn/releases/download/v0.133.0/runn_v0.133.0_darwin_arm64.zip'
      sha256 '81e089f0132b35829e6276ee85da47409aa795c497b7d07233cc2c27bbbcd43f'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.133.0/runn_v0.133.0_darwin_amd64.zip'
      sha256 '44fca3c82524446e4303ad582287b3fd69919b45d961244125399509988ca043'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.133.0/runn_v0.133.0_linux_amd64.tar.gz'
      sha256 '938a533e5cea65c5e8d89d96b47a731bfa5dc08b27701eb7a03054bc127da833'
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
