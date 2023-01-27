class Runn < Formula
  desc 'runn is a tool for running operations following a scenario.'
  homepage 'https://github.com/k1LoW/runn'
  version '0.57.0'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/runn/releases/download/v0.57.0/runn_v0.57.0_darwin_arm64.zip'
      sha256 '0d882ab0a48c13b584819e2679f6f626460b4530d92c476f56fbe338dac7309e'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.57.0/runn_v0.57.0_darwin_amd64.zip'
      sha256 'f7d5fc75e726930c62c0ab884314810cd8e66cb85dd01fd7df95dff61de84d23'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.57.0/runn_v0.57.0_linux_amd64.tar.gz'
      sha256 'ab72157dfb3dd44cda9f61cdd1991a3d18739a7dcc6e6774dfed4320107cb26d'
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
