class Runn < Formula
  desc 'runn is a tool for running operations following a scenario.'
  homepage 'https://github.com/k1LoW/runn'
  version '0.79.0'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/runn/releases/download/v0.79.0/runn_v0.79.0_darwin_arm64.zip'
      sha256 '2a34b1bb68cfd13e3ce488e8b8a9a8aad15859e488453fcadb008e7d259ce658'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.79.0/runn_v0.79.0_darwin_amd64.zip'
      sha256 '9384595c890989d6b9b2940c1b9b3e32d6ba0298aba6bb4e77af47059c65c571'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.79.0/runn_v0.79.0_linux_amd64.tar.gz'
      sha256 '6e1256c47aa63679accf481a5e88ba06925976ec9c7ceb2c335345ed16c735c7'
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
