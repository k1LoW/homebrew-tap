class Runn < Formula
  desc 'runn is a tool for running operations following a scenario.'
  homepage 'https://github.com/k1LoW/runn'
  version '0.101.0'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/runn/releases/download/v0.101.0/runn_v0.101.0_darwin_arm64.zip'
      sha256 '42b0f055b8fbedf90670a5e67ff9821f9fcb5a8996b816166bc9ede0a8c7d698'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.101.0/runn_v0.101.0_darwin_amd64.zip'
      sha256 '97c4f5fd283bb77f41cc2b60c22889803c442e45bebfe40295394946cb4029e8'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.101.0/runn_v0.101.0_linux_amd64.tar.gz'
      sha256 '28bee9bf48cdeeda03a8b3b8e462a904d9bb812608584f5b771972c1248eea25'
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
