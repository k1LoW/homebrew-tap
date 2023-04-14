class Tbls < Formula
  desc "tbls is a CI-Friendly tool for document a database, written in Go."
  version '1.65.3'
  homepage 'https://github.com/k1LoW/tbls'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.65.3/tbls_v1.65.3_darwin_arm64.zip'
      sha256 'c41d8872a910d6130be526368b8427bf4d39f427d9c5d2b9629317a0caf71760'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.65.3/tbls_v1.65.3_darwin_amd64.zip'
      sha256 'de82ecc2c1003402255180839c3396b7a31977d2d97d7c8ace94f2f16d9e7fc2'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.65.3/tbls_v1.65.3_linux_amd64.tar.gz'
      sha256 'bb6fea7895a83cdc835cf91770eb2802f30e002c12d5a7a4896653cd55faf4d7'
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
