class Runn < Formula
  desc 'runn is a tool for running operations following a scenario.'
  homepage 'https://github.com/k1LoW/runn'
  version '0.101.1'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/runn/releases/download/v0.101.1/runn_v0.101.1_darwin_arm64.zip'
      sha256 '1cb886371b14a6c21679c981a20f875c2fd2fa0cec4603bedb53f5c8589c27a0'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.101.1/runn_v0.101.1_darwin_amd64.zip'
      sha256 '03aa7682d730437534fb327f76007ea34cc898d37286d655f93b44a1247b56d6'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.101.1/runn_v0.101.1_linux_amd64.tar.gz'
      sha256 '350e7c836cdfc2cfb3aef5202f9be562bf5dca8a0d15038c7f2e520efb5c13c5'
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
