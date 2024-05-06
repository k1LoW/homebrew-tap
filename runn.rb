class Runn < Formula
  desc 'runn is a tool for running operations following a scenario.'
  homepage 'https://github.com/k1LoW/runn'
  version '0.107.1'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/runn/releases/download/v0.107.1/runn_v0.107.1_darwin_arm64.zip'
      sha256 '278911eeb690e75ec2ab7ce3dc09182bbda5ed187a749f5799ed57627d99d5c6'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.107.1/runn_v0.107.1_darwin_amd64.zip'
      sha256 '247bd7d2e70cfb906e1c4224c747687cfbbdd42c24e96b3754a26cb7e6baedfa'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.107.1/runn_v0.107.1_linux_amd64.tar.gz'
      sha256 '8fd119af59debce6f10bb73e7cc426becc68987afe4ec447d0dd42fd7db6d8de'
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
