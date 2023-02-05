class Runn < Formula
  desc 'runn is a tool for running operations following a scenario.'
  homepage 'https://github.com/k1LoW/runn'
  version '0.58.1'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/runn/releases/download/v0.58.1/runn_v0.58.1_darwin_arm64.zip'
      sha256 '85c9f7756b882ea6fc1160fe1cef94694a8727786f62fdf8b56c67a4577dd59d'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.58.1/runn_v0.58.1_darwin_amd64.zip'
      sha256 '8119df61c2efa45e016c59cc5f1aa9c0ededbc65839f4da5f89173828486f912'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.58.1/runn_v0.58.1_linux_amd64.tar.gz'
      sha256 '240a66798580d67c8a7879e08a96b59adb10be440ee8bc06ada75d12a7ac6505'
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
