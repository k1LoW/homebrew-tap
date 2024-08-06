class Runn < Formula
  desc 'runn is a tool for running operations following a scenario.'
  homepage 'https://github.com/k1LoW/runn'
  version '0.116.1'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/runn/releases/download/v0.116.1/runn_v0.116.1_darwin_arm64.zip'
      sha256 '402cae624115b16e5658407309b2a6485f1a44fd9eb1cfdd649041f0f2f5d6c5'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.116.1/runn_v0.116.1_darwin_amd64.zip'
      sha256 'df6b70b29faedf92bb9be4a044c1ea595ba00368d06e09fd805a408a64a2d906'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.116.1/runn_v0.116.1_linux_amd64.tar.gz'
      sha256 '52b7004317d8504455e098f266f739a6b4064f88c21dfe90c5a98751232e9a60'
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
