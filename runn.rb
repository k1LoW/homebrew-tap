class Runn < Formula
  desc 'runn is a tool for running operations following a scenario.'
  homepage 'https://github.com/k1LoW/runn'
  version '0.59.1'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/runn/releases/download/v0.59.1/runn_v0.59.1_darwin_arm64.zip'
      sha256 '4919a2a8d62562d6daa5cdc265f78539c390333892874537bd0bff1cd84c854d'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.59.1/runn_v0.59.1_darwin_amd64.zip'
      sha256 'c87017c3b297e80cc248da544b8e911df3cdb571867c3818b70a8af081a3a81e'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.59.1/runn_v0.59.1_linux_amd64.tar.gz'
      sha256 '0a7aebeb63e51c4f5509e67a8dbab33f2c217845fb05b6c8a111aa3a2fea587e'
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
