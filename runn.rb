class Runn < Formula
  desc 'runn is a tool for running operations following a scenario.'
  homepage 'https://github.com/k1LoW/runn'
  version '0.95.0'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/runn/releases/download/v0.95.0/runn_v0.95.0_darwin_arm64.zip'
      sha256 '5ce4192404af6c6cb4f48b64d6b63e7f86ccbcb337aee321adc0b372d660ce7a'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.95.0/runn_v0.95.0_darwin_amd64.zip'
      sha256 'd50c8608bb81a7494c2239f46494989ebc4ca7769baf9743bddd642b37509cef'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.95.0/runn_v0.95.0_linux_amd64.tar.gz'
      sha256 '4209d9f3cb1b64580694790953f90292afbf3d5a46579eabf9f855f52d712e4c'
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
