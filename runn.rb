class Runn < Formula
  desc 'runn is a tool for running operations following a scenario.'
  homepage 'https://github.com/k1LoW/runn'
  version '1.8.0'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/runn/releases/download/v1.8.0/runn_v1.8.0_darwin_arm64.zip'
      sha256 '3cd9a35f203cf64b18b73d07e16ea43b704b257c5ceb7e36c795ca9f4c6804a6'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v1.8.0/runn_v1.8.0_darwin_amd64.zip'
      sha256 '82535e34eb0a20f169231ee676edb506a6afc690224f8a49baa892bf05e5af72'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v1.8.0/runn_v1.8.0_linux_amd64.tar.gz'
      sha256 '3ba71e3dcae74a0c16a456ff21def86a46a38d466101c125510aeefa30475889'
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
