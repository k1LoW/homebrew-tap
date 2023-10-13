class Runn < Formula
  desc 'runn is a tool for running operations following a scenario.'
  homepage 'https://github.com/k1LoW/runn'
  version '0.85.0'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/runn/releases/download/v0.85.0/runn_v0.85.0_darwin_arm64.zip'
      sha256 '0a76c48885c3166508d8b4e08cf49b99f865c94f7bad8c86e1f286ea1819b931'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.85.0/runn_v0.85.0_darwin_amd64.zip'
      sha256 '9a3f2112ab63b1ce250e10a9db80bea3716d3d0a3f137cfa5bb52b916db020c9'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.85.0/runn_v0.85.0_linux_amd64.tar.gz'
      sha256 '88196b7ad1aab558be4a8f5b63083b63c35300dff404740836b8542720926188'
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
