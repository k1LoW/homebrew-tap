class Runn < Formula
  desc 'runn is a tool for running operations following a scenario.'
  homepage 'https://github.com/k1LoW/runn'
  version '0.58.2'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/runn/releases/download/v0.58.2/runn_v0.58.2_darwin_arm64.zip'
      sha256 'c2767cc85777e808b8db1bf025ea63a687bbbfebd459ae8736aba2a39de4596f'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.58.2/runn_v0.58.2_darwin_amd64.zip'
      sha256 '089dc544aea4f195f3e65fb2159da74ea00288f05bf246afb60f84cd8d8ebc9a'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.58.2/runn_v0.58.2_linux_amd64.tar.gz'
      sha256 'a521b8929a5377e0a209ba82f80b37b32376fcc928ff0441c6d84c799f0573df'
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
