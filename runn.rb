class Runn < Formula
  desc 'runn is a tool for running operations following a scenario.'
  homepage 'https://github.com/k1LoW/runn'
  version '0.53.3'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/runn/releases/download/v0.53.3/runn_v0.53.3_darwin_arm64.zip'
      sha256 '309c585533083b23a9f38cbb60bcf950d61840688d9e914d51a3e9575f1b6f64'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.53.3/runn_v0.53.3_darwin_amd64.zip'
      sha256 '6fad362e7b5d6cf5021904746c99781969eefa2d62f40742e1fc2c7515787c18'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.53.3/runn_v0.53.3_linux_amd64.tar.gz'
      sha256 '5897c24d1d637637fce006964b08172bd21423d28a57520927fa7b767b7fc6e8'
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
