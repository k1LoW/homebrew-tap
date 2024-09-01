class Runn < Formula
  desc 'runn is a tool for running operations following a scenario.'
  homepage 'https://github.com/k1LoW/runn'
  version '0.118.0'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/runn/releases/download/v0.118.0/runn_v0.118.0_darwin_arm64.zip'
      sha256 '2546f190e340d182c64eec84cd65b8cd6d8107a744c5057d3e34095358bd4eb8'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.118.0/runn_v0.118.0_darwin_amd64.zip'
      sha256 '70377dba82f72c20515aaef771933ac6bd9167b7183d2262b95d9822d96c84ea'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.118.0/runn_v0.118.0_linux_amd64.tar.gz'
      sha256 '8982fb049e80dfbe9930e2ba7d688406c09db1e15d6c4c264f8da750034a0c4c'
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
