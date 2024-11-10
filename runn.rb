class Runn < Formula
  desc 'runn is a tool for running operations following a scenario.'
  homepage 'https://github.com/k1LoW/runn'
  version '0.121.1'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/runn/releases/download/v0.121.1/runn_v0.121.1_darwin_arm64.zip'
      sha256 '327e8ee2e941b858536d0dee8c96f8408d937e753682cb2afa85b0aff0e3cef3'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.121.1/runn_v0.121.1_darwin_amd64.zip'
      sha256 '1fbeba55ce619c664c0dda57073cdffacc52bd39bc083c67dc5dee52d41eee17'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.121.1/runn_v0.121.1_linux_amd64.tar.gz'
      sha256 'aac39a434f2ce0a3848bd2c3579098a5a13b074c07b6bc4addf111cc6f01a4fa'
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
