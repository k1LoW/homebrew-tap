class Runn < Formula
  desc 'runn is a tool for running operations following a scenario.'
  homepage 'https://github.com/k1LoW/runn'
  version '0.123.0'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/runn/releases/download/v0.123.0/runn_v0.123.0_darwin_arm64.zip'
      sha256 'fafb80990ac6f272f708c5efd62682df2c899c0c37cb59e28c28f0a0b370ad1e'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.123.0/runn_v0.123.0_darwin_amd64.zip'
      sha256 '10981cd133ada216cd425a5cb9dfbaa5e46e98d15185ba33c9997e362db60ea2'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.123.0/runn_v0.123.0_linux_amd64.tar.gz'
      sha256 '73b46c182a63092ec565f67ed9ce526ba06fae7ae40834729ab3c3cb3d62e84d'
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
