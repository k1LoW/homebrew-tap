class Runn < Formula
  desc 'runn is a tool for running operations following a scenario.'
  homepage 'https://github.com/k1LoW/runn'
  version '0.104.2'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/runn/releases/download/v0.104.2/runn_v0.104.2_darwin_arm64.zip'
      sha256 'a83c12a79e28b13659be7197a1338f2bbd68db5b68c5928afaf87be36353b66a'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.104.2/runn_v0.104.2_darwin_amd64.zip'
      sha256 'eba47e0f1bf373f41749a6dac0619b8e49dabbeb3353bdc0e4e45460a1a48fbf'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.104.2/runn_v0.104.2_linux_amd64.tar.gz'
      sha256 '18aa443317bf4b0d4bd5ff76e64ef5c6bf3034de1ef688a93d75e2a30034f25a'
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
