class Runn < Formula
  desc 'runn is a tool for running operations following a scenario.'
  homepage 'https://github.com/k1LoW/runn'
  version '0.98.1'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/runn/releases/download/v0.98.1/runn_v0.98.1_darwin_arm64.zip'
      sha256 'eb17ac0a6757ad9976e47ac62da5ce2002b252f43c280192a8f5f222fad2aaa2'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.98.1/runn_v0.98.1_darwin_amd64.zip'
      sha256 '2a57df9eb5a735d579fe41d291e90bbacd34543ee3a7ed65a31acdee6f96c780'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.98.1/runn_v0.98.1_linux_amd64.tar.gz'
      sha256 '3f41f8bbaf6f4f1d856cd3e3e1b3bdaca51218fdb1df2e577d3ff670d03b3b33'
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
