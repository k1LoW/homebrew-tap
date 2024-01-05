class Runn < Formula
  desc 'runn is a tool for running operations following a scenario.'
  homepage 'https://github.com/k1LoW/runn'
  version '0.94.0'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/runn/releases/download/v0.94.0/runn_v0.94.0_darwin_arm64.zip'
      sha256 '3a125b8203b9fea1f2058decd8c1bb68ecce7b630f34d0a06bb678b0d575fffb'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.94.0/runn_v0.94.0_darwin_amd64.zip'
      sha256 '98da2eabda21531f40ab578f8f08e44a0b561b6211e25331d061907c6f84ca50'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.94.0/runn_v0.94.0_linux_amd64.tar.gz'
      sha256 '0ceedc5670beb9001527242b8b14fbbecfe9bc7b03e9f503e902bdbed9670db0'
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
