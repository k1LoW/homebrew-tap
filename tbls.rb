class Tbls < Formula
  desc "tbls is a CI-Friendly tool for document a database, written in Go."
  version '1.56.4'
  homepage 'https://github.com/k1LoW/tbls'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.56.4/tbls_v1.56.4_darwin_arm64.zip'
      sha256 'cad36adf526939c9c1d672c6c80befa57aa745ae1c5139bbd62516486418c7e6'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.56.4/tbls_v1.56.4_darwin_amd64.zip'
      sha256 'b4146381e40ee1b9d91ebdc6fbf09bafb1b94dda12ec48f0d675a6e61208a893'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.56.4/tbls_v1.56.4_linux_amd64.tar.gz'
      sha256 '7abb2067e5fbef3adf2224117552223ff5db0d38c09c19d01cfbec9ea58f84c4'
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
