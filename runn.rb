class Runn < Formula
  desc 'runn is a tool for running operations following a scenario.'
  homepage 'https://github.com/k1LoW/runn'
  version '0.91.1'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/runn/releases/download/v0.91.1/runn_v0.91.1_darwin_arm64.zip'
      sha256 'c5b816c524d98a9edd33dc14787a0b25312a5722329745a244c8e02db74d0778'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.91.1/runn_v0.91.1_darwin_amd64.zip'
      sha256 'c463280753632fe6b6a9947c78a5dea46ca4493df707a98799e2f84288ed9931'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.91.1/runn_v0.91.1_linux_amd64.tar.gz'
      sha256 '61119ff17c63c41f6da46957ace4e83b9e775947f6e1bfc84adbbb1e56b539f2'
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
