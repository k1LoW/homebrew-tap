class Runn < Formula
  desc 'runn is a tool for running operations following a scenario.'
  homepage 'https://github.com/k1LoW/runn'
  version '0.127.2'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/runn/releases/download/v0.127.2/runn_v0.127.2_darwin_arm64.zip'
      sha256 '8ad3ad3c79ef861d9d69218f569676f5c8fa77beee13c9760f73bba1a4126d7c'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.127.2/runn_v0.127.2_darwin_amd64.zip'
      sha256 '40bc0cde474c63c389e032bbd3f20525fd0974962fb592a5fa3f2dbb4fcf65e8'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.127.2/runn_v0.127.2_linux_amd64.tar.gz'
      sha256 '6e7678300b9cd520e85f38fc79d18368b61b635fe4f7eef37cc44eef16fd0983'
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
