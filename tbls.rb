class Tbls < Formula
  desc 'tbls is a CI-Friendly tool for document a database, written in Go.'
  version '1.85.0'
  homepage 'https://github.com/k1LoW/tbls'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.85.0/tbls_v1.85.0_darwin_arm64.zip'
      sha256 '4c405ae2ffe77ac133320f4cb0a0403c64f9fda90402fa42003d2c202df37b86'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.85.0/tbls_v1.85.0_darwin_amd64.zip'
      sha256 'df31d52d7198744237ff24d0b9419b182827938e69537c42a2bdca28eb697d87'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.85.0/tbls_v1.85.0_linux_arm64.tar.gz'
      sha256 'da4672968639105b5ced25068717d73ed8d4399d1ca774c1cb5ab283f9aa92bb'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.85.0/tbls_v1.85.0_linux_amd64.tar.gz'
      sha256 '911af9c05562481c4c93fc361dfda026e43eaa5e701364621efd339c2e1a6ef2'
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
