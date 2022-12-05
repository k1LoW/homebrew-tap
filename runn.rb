class Runn < Formula
  desc 'runn is a tool for running operations following a scenario.'
  homepage 'https://github.com/k1LoW/runn'
  version '0.53.1'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/runn/releases/download/v0.53.1/runn_v0.53.1_darwin_arm64.zip'
      sha256 'd227efc9a5576d50176b42c7856ecdccbfdfa916a0283e91d34dd9ea4da89d98'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.53.1/runn_v0.53.1_darwin_amd64.zip'
      sha256 '84c8904c0379337ea62b33174a6d4fcd78be5bda4d8d1a99690af585999bceed'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.53.1/runn_v0.53.1_linux_amd64.tar.gz'
      sha256 '38d2a3225bc6797d05d652be1d7fa9aa7665703fee16a9d93cb15deb207fe96e'
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
