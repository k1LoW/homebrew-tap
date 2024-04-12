class Runn < Formula
  desc 'runn is a tool for running operations following a scenario.'
  homepage 'https://github.com/k1LoW/runn'
  version '0.102.0'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/runn/releases/download/v0.102.0/runn_v0.102.0_darwin_arm64.zip'
      sha256 'b0adba1e407dfa117a7d9e572af8272caacccb788ffc317e7e1e57b83fcf4c26'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.102.0/runn_v0.102.0_darwin_amd64.zip'
      sha256 '94e669898ca725068ede5464e736d0555e4b7e8ab8905f871a0d160a18806d8e'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.102.0/runn_v0.102.0_linux_amd64.tar.gz'
      sha256 '58510383eb38f2da9fdbe362ca107a237e85c8f6aef23c31f8929124e79977fb'
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
