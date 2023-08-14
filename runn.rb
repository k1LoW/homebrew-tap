class Runn < Formula
  desc 'runn is a tool for running operations following a scenario.'
  homepage 'https://github.com/k1LoW/runn'
  version '0.80.3'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/runn/releases/download/v0.80.3/runn_v0.80.3_darwin_arm64.zip'
      sha256 'f37ab46348588e6e2eaa3acf566d454250a67485ba422eb5e7ac11f220bdd529'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.80.3/runn_v0.80.3_darwin_amd64.zip'
      sha256 '8b4f0fd0e7ab1d41b2e72e12541a36c8bbc48f770a2e174bfc84035b733349ae'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/runn/releases/download/v0.80.3/runn_v0.80.3_linux_amd64.tar.gz'
      sha256 '3d83f1dcf5e349024d91238918c038ba9e290578d5503be9d143336f41053e85'
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
