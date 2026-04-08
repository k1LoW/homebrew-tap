class Tbls < Formula
  desc 'tbls is a CI-Friendly tool for document a database, written in Go.'
  version '1.94.3'
  homepage 'https://github.com/k1LoW/tbls'

  deprecate! date: "2025-08-02", because: "please use the official Homebrew formula instead"

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.94.3/tbls_v1.94.3_darwin_arm64.zip'
      sha256 '05e7f5cb018d9940be3aa76168352cfae84e2622e2aa5ca02362f5ee89918942'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.94.3/tbls_v1.94.3_darwin_amd64.zip'
      sha256 '074ea05641ae6d171126a43af85cb0c4287d4c4246babc08c43ca6737c3e6969'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.94.3/tbls_v1.94.3_linux_arm64.tar.gz'
      sha256 'a5a952fd91efb59d98d6745016d27318e54af159809e2506d64b12b7f0cb08b8'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.94.3/tbls_v1.94.3_linux_amd64.tar.gz'
      sha256 'f71a4f1999cfa9e98c94b617e7c61bee436b945c37ff8d14a954a338ddc7caae'
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
