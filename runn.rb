class Runn < Formula
  desc 'runn is a tool for running operations following a scenario.'
  homepage 'https://github.com/k1LoW/runn'
  version '0.90.3'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/runn/releases/download/v0.90.3/runn_v0.90.3_darwin_arm64.zip'
      sha256 'acf724ddc10df65f5d034d1f094fc06eff1bbb46bdb82ee673a670466b53708a'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.90.3/runn_v0.90.3_darwin_amd64.zip'
      sha256 '98e9027d38227900114b039d10221468e9f59ed4bda5d7753e9d12c64d28bc7d'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.90.3/runn_v0.90.3_linux_amd64.tar.gz'
      sha256 'b97ae764b69cfb5d19811d6efbfc0ccd6cf7ecc04ccdead3b5b375c77d7a09f1'
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
