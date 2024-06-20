class Runn < Formula
  desc 'runn is a tool for running operations following a scenario.'
  homepage 'https://github.com/k1LoW/runn'
  version '0.113.2'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/runn/releases/download/v0.113.2/runn_v0.113.2_darwin_arm64.zip'
      sha256 '2cc4c6e3aa18a1195916c3e9c0d4ead795f54f785128f10ba1abf8534615317f'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.113.2/runn_v0.113.2_darwin_amd64.zip'
      sha256 '76a061a1bdedb750008aef26131f4adff3b83e0df1f6afb53cb24064d748caa0'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.113.2/runn_v0.113.2_linux_amd64.tar.gz'
      sha256 '636f00a2ee001bad552b22fd2ca2a60da30d49b4c1edbd81f995f3e7dd477589'
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
