class Tbls < Formula
  desc 'tbls is a CI-Friendly tool for document a database, written in Go.'
  version '1.85.1'
  homepage 'https://github.com/k1LoW/tbls'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.85.1/tbls_v1.85.1_darwin_arm64.zip'
      sha256 '2f7b87065652f91c60b20d6c6ccbac3a0281c1cbcf87ed14c953e05ca2e9e630'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.85.1/tbls_v1.85.1_darwin_amd64.zip'
      sha256 'a49ee376b0ae4be6bf31f125f9f085e8d5be4fb88360a0925fa9422e6277bbe0'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.85.1/tbls_v1.85.1_linux_arm64.tar.gz'
      sha256 '186a54965bbc90052c42d27be7101c97d206181797397d68feff036000580e74'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.85.1/tbls_v1.85.1_linux_amd64.tar.gz'
      sha256 'b0bb64953c50dcb773b0249a1e59d9eb474caebb7cb9239a71d3c9a9adef289d'
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
