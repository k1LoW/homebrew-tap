class Runn < Formula
  desc 'runn is a tool for running operations following a scenario.'
  homepage 'https://github.com/k1LoW/runn'
  version '0.60.1'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/runn/releases/download/v0.60.1/runn_v0.60.1_darwin_arm64.zip'
      sha256 'e2d9761c58249d6f04d1e3b215ff7c5ec5af4ace826fc0daa736d47366456639'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.60.1/runn_v0.60.1_darwin_amd64.zip'
      sha256 'a00035b1fe93b42c272e88de64ab7c87a2b7f344867a1f56d803671be66e1208'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.60.1/runn_v0.60.1_linux_amd64.tar.gz'
      sha256 'd849774ea7cd54a5a8faf227f0ef385fa9c74f7ccbae400e935c5e1089091f52'
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
