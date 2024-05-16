class Runn < Formula
  desc 'runn is a tool for running operations following a scenario.'
  homepage 'https://github.com/k1LoW/runn'
  version '0.107.2'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/runn/releases/download/v0.107.2/runn_v0.107.2_darwin_arm64.zip'
      sha256 '56182fd18d568d94230bf73e662a6462b38f1b1c5c0623df9eeea6352633365d'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.107.2/runn_v0.107.2_darwin_amd64.zip'
      sha256 'db6fa5c8f5b489e6af53804b8b53df110dcac12cbd679ebf0f918bdfde6041d9'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.107.2/runn_v0.107.2_linux_amd64.tar.gz'
      sha256 '6b1bd87225b929ec073bab3c178d2edadc766fe645627bdbb6163495d8f41327'
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
