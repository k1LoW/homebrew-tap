class Runn < Formula
  desc 'runn is a tool for running operations following a scenario.'
  homepage 'https://github.com/k1LoW/runn'
  version '0.42.1'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/runn/releases/download/v0.42.1/runn_v0.42.1_darwin_arm64.zip'
      sha256 'f999998b39874e4c373657e0c63de7e650bae4e06c12e4cc878f676fb135a13c'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.42.1/runn_v0.42.1_darwin_amd64.zip'
      sha256 'ec0f8942510bdd81de1e24426200f8fa4d1167254337f027a405e73486247913'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.42.1/runn_v0.42.1_linux_amd64.tar.gz'
      sha256 'f0e83108c9c5739a5c90f2bff47a6ac1292f911734216497f5f1f796d3dc34b3'
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
