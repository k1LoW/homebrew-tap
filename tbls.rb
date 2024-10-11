class Tbls < Formula
  desc 'tbls is a CI-Friendly tool for document a database, written in Go.'
  version '1.78.0'
  homepage 'https://github.com/k1LoW/tbls'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.78.0/tbls_v1.78.0_darwin_arm64.zip'
      sha256 'e3cc77425ccf87988cd6d7ea7cfafab32ef198038cbb4e3e35972ad86e53c600'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.78.0/tbls_v1.78.0_darwin_amd64.zip'
      sha256 '514b82252db2a97544993f86c6289117ae21bfe0913499ba9cda3be55b161915'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.78.0/tbls_v1.78.0_linux_arm64.tar.gz'
      sha256 '4b7a7de4f2fc8ef6dcff10605395b29ef8422985581a4df5bf1a9893b93aa12d'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.78.0/tbls_v1.78.0_linux_amd64.tar.gz'
      sha256 '6060b98be39d7df3e14ee4861e22d4519649e989e59e6720c41a0d483e23b375'
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
