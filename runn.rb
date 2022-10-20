class Runn < Formula
  desc 'runn is a tool for running operations following a scenario.'
  homepage 'https://github.com/k1LoW/runn'
  version '0.40.0'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/runn/releases/download/v0.40.0/runn_v0.40.0_darwin_arm64.zip'
      sha256 'e64c1b92735fbf3b912861d5a88cfa4e36a445787f13f3a6a92457d6d789767e'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.40.0/runn_v0.40.0_darwin_amd64.zip'
      sha256 '489605b79226033aae640d17bf714775de789e9e32fb622ad1070ead03b10571'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.40.0/runn_v0.40.0_linux_amd64.tar.gz'
      sha256 '003f844c9d65a0f0e9efdf4145dd0f3503112de1457b8dde442807a30cc77856'
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
