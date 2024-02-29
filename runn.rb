class Runn < Formula
  desc 'runn is a tool for running operations following a scenario.'
  homepage 'https://github.com/k1LoW/runn'
  version '0.99.5'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/runn/releases/download/v0.99.5/runn_v0.99.5_darwin_arm64.zip'
      sha256 '2719714bf0516c5fce062d86d0094852b0604c40243f6ff49d4e107dde3ddfd4'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.99.5/runn_v0.99.5_darwin_amd64.zip'
      sha256 '042073faa3ea1ba52174a8afd3614ff2a1f93fd57b8dbae87653b3b7943e4087'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.99.5/runn_v0.99.5_linux_amd64.tar.gz'
      sha256 'baa6474d9722f3882394e02ea97c42056ee0f97e5f50f624c4a1c8263bc95c5f'
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
