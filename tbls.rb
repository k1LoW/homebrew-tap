class Tbls < Formula
  desc 'tbls is a CI-Friendly tool for document a database, written in Go.'
  version '1.84.0'
  homepage 'https://github.com/k1LoW/tbls'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.84.0/tbls_v1.84.0_darwin_arm64.zip'
      sha256 'fab58a2437857da29a0fc3e2565b644b763eaa4df92bdf8ecd206b29591a5d85'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.84.0/tbls_v1.84.0_darwin_amd64.zip'
      sha256 'e7e8fe6161f3692fdcb26ab7220904df8897a35a422490332a14e3f10d6e0893'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.84.0/tbls_v1.84.0_linux_arm64.tar.gz'
      sha256 '343acd06769e3510cc02b0c09cc3853c89822ce7d845d2b031cdadb2acd13060'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.84.0/tbls_v1.84.0_linux_amd64.tar.gz'
      sha256 '83f35a07fd2a00c2aa360a47edca6d261f5208186911977eff39097151fc57d5'
    end
  end

  head do
    url 'https://github.com/k1LoW/tbls.git'
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    system './tbls', 'completion', 'bash', '--out', 'tbls.bash'
    system './tbls', 'completion', 'zsh', '--out', 'tbls.zsh'
    bin.install 'tbls'
    bash_completion.install 'tbls.bash' => 'tbls'
    zsh_completion.install 'tbls.zsh' => '_tbls'
  end
end
