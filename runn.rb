class Runn < Formula
  desc 'runn is a tool for running operations following a scenario.'
  homepage 'https://github.com/k1LoW/runn'
  version '0.132.0'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/runn/releases/download/v0.132.0/runn_v0.132.0_darwin_arm64.zip'
      sha256 'e62d419ec09ed259da77010ba3d93f348ad3209df42d046fe7a5c0437d61dcd5'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.132.0/runn_v0.132.0_darwin_amd64.zip'
      sha256 'dcc24da34b1af9fdbe3f62d6ae1dfcb732288b6f8284c0e661a49414a1cdefc6'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.132.0/runn_v0.132.0_linux_amd64.tar.gz'
      sha256 '1f1e769702445080873604bdffd22e495d181d71b755b95c1df57eaf69cc4557'
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
