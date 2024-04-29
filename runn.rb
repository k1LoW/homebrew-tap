class Runn < Formula
  desc 'runn is a tool for running operations following a scenario.'
  homepage 'https://github.com/k1LoW/runn'
  version '0.105.1'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/runn/releases/download/v0.105.1/runn_v0.105.1_darwin_arm64.zip'
      sha256 '7cc35ea02aa45cfc94d78bbb28f714e90155154f9d520f01f82837718ae344d2'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.105.1/runn_v0.105.1_darwin_amd64.zip'
      sha256 '88e767309c20534d754646251739633d4cd5f3c95efd953f74cb75da01df1601'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.105.1/runn_v0.105.1_linux_amd64.tar.gz'
      sha256 'b5de168b111626c0be4e440e92e519d98fec15c6b5265fa280c12634d717c1cb'
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
