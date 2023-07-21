class Runn < Formula
  desc 'runn is a tool for running operations following a scenario.'
  homepage 'https://github.com/k1LoW/runn'
  version '0.76.2'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/runn/releases/download/v0.76.2/runn_v0.76.2_darwin_arm64.zip'
      sha256 '07fc6346c024349519ed447f7c36dda11295c0b64898412a3d8fcaf702630047'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.76.2/runn_v0.76.2_darwin_amd64.zip'
      sha256 'e5192d0ad332cdd28104222997104dd8587754c91354a916601d02a0dc8bd2dc'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.76.2/runn_v0.76.2_linux_amd64.tar.gz'
      sha256 '4eff290e9eb3ffd5ba8bbf52a3fb0044cd69241a703fa63a48d7f7f8398fd919'
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
