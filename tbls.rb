class Tbls < Formula
  desc 'tbls is a CI-Friendly tool for document a database, written in Go.'
  version '1.94.2'
  homepage 'https://github.com/k1LoW/tbls'

  deprecate! date: "2025-08-02", because: "please use the official Homebrew formula instead"

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.94.2/tbls_v1.94.2_darwin_arm64.zip'
      sha256 'd9e9b498c8bb6ec930d11ad677792a632f693c38328ab01c7b5feab0b2e70704'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.94.2/tbls_v1.94.2_darwin_amd64.zip'
      sha256 '1661ee1c7f6be98257d36184f83a8001cc60c5196de9c112caa76009d358bb1b'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.94.2/tbls_v1.94.2_linux_arm64.tar.gz'
      sha256 'bbb2041f559afa874a3146ce5b6ed5a83244e5d8add6b1aa1b1684c0cc8d528b'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.94.2/tbls_v1.94.2_linux_amd64.tar.gz'
      sha256 '621cf00ffe4fdc5841dd12bd36dd5a9f643b2c90ef08a997a47bf0e71cd8d736'
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
