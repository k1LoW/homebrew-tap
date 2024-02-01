class Runn < Formula
  desc 'runn is a tool for running operations following a scenario.'
  homepage 'https://github.com/k1LoW/runn'
  version '0.98.3'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/runn/releases/download/v0.98.3/runn_v0.98.3_darwin_arm64.zip'
      sha256 'd76a6786a31b1da7d499cb53ed39f500bac9fc34d6bfc6928b5f339524e9cf24'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.98.3/runn_v0.98.3_darwin_amd64.zip'
      sha256 'afc2f2bfa78814c348630785b9c1fe5f2f8324807e927e777e03571b0b2d42ce'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.98.3/runn_v0.98.3_linux_amd64.tar.gz'
      sha256 '2a9b50c1dd03a190b36f8adab2f671ad0145a8757000261ae64427befac4b525'
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
