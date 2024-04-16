class Runn < Formula
  desc 'runn is a tool for running operations following a scenario.'
  homepage 'https://github.com/k1LoW/runn'
  version '0.103.4'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/runn/releases/download/v0.103.4/runn_v0.103.4_darwin_arm64.zip'
      sha256 'ead53eea2e2685bbe79bf8d5b877ed9e79afeb7027f62bd4caa68503549706fa'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.103.4/runn_v0.103.4_darwin_amd64.zip'
      sha256 '2a68c6c2b16e2d3ab5dc1b170324aa329533490233501b8ded38a25567d062b2'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.103.4/runn_v0.103.4_linux_amd64.tar.gz'
      sha256 'c9aaba40dfaa35fcb1d023cafec14055fd693fb1d9d7532be7233b93a9d9f036'
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
