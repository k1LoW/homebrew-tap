class Runn < Formula
  desc 'runn is a tool for running operations following a scenario.'
  homepage 'https://github.com/k1LoW/runn'
  version '0.52.2'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/runn/releases/download/v0.52.2/runn_v0.52.2_darwin_arm64.zip'
      sha256 '8acb3000bd181056d25f3fb1a182f4a58f24f104023f5bf3615a0f8485649d83'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.52.2/runn_v0.52.2_darwin_amd64.zip'
      sha256 'c7fe7d97b9c6db51ca2e28307454cb197d67dc4150792e977677f52b6643ceb7'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.52.2/runn_v0.52.2_linux_amd64.tar.gz'
      sha256 'fa5edca2fc013fda7ebe5e33f60b4fb6d6964c326c0424752f191034376d8519'
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
