class Runn < Formula
  desc 'runn is a tool for running operations following a scenario.'
  homepage 'https://github.com/k1LoW/runn'
  version '0.103.1'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/runn/releases/download/v0.103.1/runn_v0.103.1_darwin_arm64.zip'
      sha256 '3e586e8e087d6191303ee526992e471477cff7751279d41aa522487fdfaf03da'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.103.1/runn_v0.103.1_darwin_amd64.zip'
      sha256 '40a2f97ff3e38bd161822c8f4a208145c05bf85fef39b2611be4bff9ed3d5401'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.103.1/runn_v0.103.1_linux_amd64.tar.gz'
      sha256 '2ef9ae51d726688d1caeacde553a1ba3973da88204d2c1b7e13dcc99fa6e1d5a'
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
