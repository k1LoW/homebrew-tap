class Runn < Formula
  desc 'runn is a tool for running operations following a scenario.'
  homepage 'https://github.com/k1LoW/runn'
  version '0.130.1'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/runn/releases/download/v0.130.1/runn_v0.130.1_darwin_arm64.zip'
      sha256 'd1a11528b22c14bc39b052ca5ffd06655b8a73454ed7b340a51e180a9c50d4ca'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.130.1/runn_v0.130.1_darwin_amd64.zip'
      sha256 '009c35ff7b78f0b75c518a264ce651bda43b0bf3966390ef67f308f55f139a7c'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.130.1/runn_v0.130.1_linux_amd64.tar.gz'
      sha256 '5767a3a256f55bd9e214d6b9a43bdd1af5b2df73ce7ee9b99756c04b2ae13212'
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
