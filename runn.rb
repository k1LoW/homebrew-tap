class Runn < Formula
  desc 'runn is a tool for running operations following a scenario.'
  homepage 'https://github.com/k1LoW/runn'
  version '1.8.2'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/runn/releases/download/v1.8.2/runn_v1.8.2_darwin_arm64.zip'
      sha256 '899c2279fb02c841503ace2a12a5293db1f6b251ae91bda92d9a544cfb7f1005'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v1.8.2/runn_v1.8.2_darwin_amd64.zip'
      sha256 '231d686dd682d38afbc90dfbd2a471c92893865af897f044a3c09db35915d15b'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v1.8.2/runn_v1.8.2_linux_amd64.tar.gz'
      sha256 '224d3ade6b8f0168846c0a4a4380396ab4d040be0e2c3dfa474fc4fbf072a537'
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
