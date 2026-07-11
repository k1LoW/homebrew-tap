class Tbls < Formula
  desc 'tbls is a CI-Friendly tool for document a database, written in Go.'
  version '1.95.0'
  homepage 'https://github.com/k1LoW/tbls'

  deprecate! date: "2025-08-02", because: "please use the official Homebrew formula instead"

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.95.0/tbls_v1.95.0_darwin_arm64.zip'
      sha256 '1aa34bf1071dcfbd7052be09e2a69886613badcee1f64cb5500415419b9afcaa'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.95.0/tbls_v1.95.0_darwin_amd64.zip'
      sha256 '713e5c73152b80985476f04a8960d23e4486ba3be400888b2659bba9e5f0f765'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.95.0/tbls_v1.95.0_linux_arm64.tar.gz'
      sha256 'a0ed19ba422101f0860b9e868186810461c9ac81dddb9688eb82689e686bea6b'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.95.0/tbls_v1.95.0_linux_amd64.tar.gz'
      sha256 '035110bb1b5bc1b918c375e5bd7c2b5922c5f517cc0886e5bf4f867dfa836259'
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
