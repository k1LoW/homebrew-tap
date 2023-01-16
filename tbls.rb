class Tbls < Formula
  desc "tbls is a CI-Friendly tool for document a database, written in Go."
  version '1.58.0'
  homepage 'https://github.com/k1LoW/tbls'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.58.0/tbls_v1.58.0_darwin_arm64.zip'
      sha256 '7860e703ebb2766796b5b5f57f7a3188ef75d83387af8cf52c336972ebc580ab'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.58.0/tbls_v1.58.0_darwin_amd64.zip'
      sha256 '9176fe69f0d1a4e5df103314c24e64365f9e968395a2cfc0fed62cfd6f87670b'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.58.0/tbls_v1.58.0_linux_amd64.tar.gz'
      sha256 '1210e594d0176a1625983d38ec0ceef5740406529d6627d1e3c7fd5b3b63ab80'
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
