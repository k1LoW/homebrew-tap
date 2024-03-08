class Runn < Formula
  desc 'runn is a tool for running operations following a scenario.'
  homepage 'https://github.com/k1LoW/runn'
  version '0.100.0'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/runn/releases/download/v0.100.0/runn_v0.100.0_darwin_arm64.zip'
      sha256 '6533b4b71c58f3258ce8c332daf78eb336f9cbe78ad2fbfe4fdac728333d20bc'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.100.0/runn_v0.100.0_darwin_amd64.zip'
      sha256 '9e08b60f49d3a382cf44a1fc8c1ac7e0ec8ce1d0b6133f6307057caa7a3ef088'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.100.0/runn_v0.100.0_linux_amd64.tar.gz'
      sha256 '970bfeee3718bbf2e636daf2bd82b756e01fc5733aacef6bc7500b60ce3ed1ea'
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
