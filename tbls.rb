class Tbls < Formula
  desc "tbls is a CI-Friendly tool for document a database, written in Go."
  version '1.63.0'
  homepage 'https://github.com/k1LoW/tbls'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.63.0/tbls_v1.63.0_darwin_arm64.zip'
      sha256 'e99f5773fc504b39574391d3bd395897a79ad9b472d540b44f5a0cc6360e7461'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.63.0/tbls_v1.63.0_darwin_amd64.zip'
      sha256 'a60af0e7a8eefce0f2193539aba45bb22aab1763f0c5cd85fb644a767f7ca736'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.63.0/tbls_v1.63.0_linux_amd64.tar.gz'
      sha256 'ccfe9e2af5c875e4fb76b67a34aba42ffcd4529570f6bb617ccdefddede0f20e'
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
