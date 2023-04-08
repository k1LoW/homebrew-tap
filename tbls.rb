class Tbls < Formula
  desc "tbls is a CI-Friendly tool for document a database, written in Go."
  version '1.65.1'
  homepage 'https://github.com/k1LoW/tbls'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.65.1/tbls_v1.65.1_darwin_arm64.zip'
      sha256 '640ebc714aa52d3a1445e8192337efca878dccd8db4d79d19e61ba0d174633ba'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.65.1/tbls_v1.65.1_darwin_amd64.zip'
      sha256 '0bbe29e904562c7dcfcd0eafe15ecea19a71e63464bc6182d23965961d0fce02'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.65.1/tbls_v1.65.1_linux_amd64.tar.gz'
      sha256 '65d5ce20ba83e28d51e04f152064b041c06e5a23be27f8146b5bf2a1dd6db927'
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
