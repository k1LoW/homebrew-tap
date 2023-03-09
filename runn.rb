class Runn < Formula
  desc 'runn is a tool for running operations following a scenario.'
  homepage 'https://github.com/k1LoW/runn'
  version '0.63.2'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/runn/releases/download/v0.63.2/runn_v0.63.2_darwin_arm64.zip'
      sha256 '6a24c021c6e8b368991ab7208da47d25a26563275ccdb8aa180ff4de9b98c4b4'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.63.2/runn_v0.63.2_darwin_amd64.zip'
      sha256 '4f6398cafbf0b4c09634addec943d1b15c2eebb94ae7a64d71e98d97f56a69a7'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.63.2/runn_v0.63.2_linux_amd64.tar.gz'
      sha256 'df72a9ac72eee7a14e8bd5e1ecccda72984ae2ee970eaeec20db19aabf1e31f3'
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
