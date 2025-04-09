class Runn < Formula
  desc 'runn is a tool for running operations following a scenario.'
  homepage 'https://github.com/k1LoW/runn'
  version '0.129.3'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/runn/releases/download/v0.129.3/runn_v0.129.3_darwin_arm64.zip'
      sha256 '86cacff073cf691ef6854ff0d6572710df10f42ed5b7bc05ed6a566be20b275b'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.129.3/runn_v0.129.3_darwin_amd64.zip'
      sha256 '97eee8fac367616adc9a196c1745343fc8dd91dea68bde44a5d7f40c1f45133d'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.129.3/runn_v0.129.3_linux_amd64.tar.gz'
      sha256 'ae4ac73d271badd0a743d0a1207beda2fc19d35a830582ec1ce13f4d7547c3a1'
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
