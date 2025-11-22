class Runn < Formula
  desc 'runn is a tool for running operations following a scenario.'
  homepage 'https://github.com/k1LoW/runn'
  version '1.1.0'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/runn/releases/download/v1.1.0/runn_v1.1.0_darwin_arm64.zip'
      sha256 '174c0ed968f84c8883754d87e9f3de92a10bb7aca0c9d4ee9f77f766384623af'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v1.1.0/runn_v1.1.0_darwin_amd64.zip'
      sha256 '79f4d439de5ce5a70be7ca0023211099e4689ad4e927f79992e445916efb6db9'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v1.1.0/runn_v1.1.0_linux_amd64.tar.gz'
      sha256 '49c8b9d0272f0170ef50b6a5045eb500651d4e186727d7a6972acf625d44898e'
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
