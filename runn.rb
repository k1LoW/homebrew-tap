class Runn < Formula
  desc 'runn is a tool for running operations following a scenario.'
  homepage 'https://github.com/k1LoW/runn'
  version '0.132.1'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/runn/releases/download/v0.132.1/runn_v0.132.1_darwin_arm64.zip'
      sha256 'b6c02ab50b8bce50c60112b96620d636bb276563a3b72ed7e2787800f6b46fde'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.132.1/runn_v0.132.1_darwin_amd64.zip'
      sha256 '77860bbbbde74426ceceffeaf42286e0e695150a601754dec4636f4e54ecf4a6'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.132.1/runn_v0.132.1_linux_amd64.tar.gz'
      sha256 '6f5a79ff953823b4527efdbbba7fc3569ed9218a695f56d1209389aef3aa784c'
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
