class Runn < Formula
  desc 'runn is a tool for running operations following a scenario.'
  homepage 'https://github.com/k1LoW/runn'
  version '0.49.3'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/runn/releases/download/v0.49.3/runn_v0.49.3_darwin_arm64.zip'
      sha256 'd3751d1eee19bcf9912b7b7671734141b003fe5a437ee3db64bea8745941eeb0'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.49.3/runn_v0.49.3_darwin_amd64.zip'
      sha256 '0d44cb22b2205fc84816f15bae075fdaf742d77b60154458ed45dc0ef849607b'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.49.3/runn_v0.49.3_linux_amd64.tar.gz'
      sha256 '6caaa83d20009dc4d7b0870191acbc3f391cd250435a811d92b3a2c41fc8c480'
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
