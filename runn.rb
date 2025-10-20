class Runn < Formula
  desc 'runn is a tool for running operations following a scenario.'
  homepage 'https://github.com/k1LoW/runn'
  version '0.140.1'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/runn/releases/download/v0.140.1/runn_v0.140.1_darwin_arm64.zip'
      sha256 '5c5dcc23fb29de36622f97696ae2c8316eb8975f6d51463fe6cab712fedc1e17'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.140.1/runn_v0.140.1_darwin_amd64.zip'
      sha256 'fa54487501ce02e1ac7618ab8f8150b06c26eed38ab70ac142e6ca8fce8316d7'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.140.1/runn_v0.140.1_linux_amd64.tar.gz'
      sha256 '448387eb5ea7dc8742e8c74faa451b852799ef33e949fbbd7750a9018978682f'
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
