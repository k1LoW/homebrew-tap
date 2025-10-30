class Tbls < Formula
  desc 'tbls is a CI-Friendly tool for document a database, written in Go.'
  version '1.91.2'
  homepage 'https://github.com/k1LoW/tbls'

  deprecate! date: "2025-08-02", because: "please use the official Homebrew formula instead"

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.91.2/tbls_v1.91.2_darwin_arm64.zip'
      sha256 'af9c3ed37415d71c2ab23347b6bca25f552fbbdce6ad97f1f024bc99d5753478'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.91.2/tbls_v1.91.2_darwin_amd64.zip'
      sha256 '7d3894c6e0a8ad038ee8aa3af177fca56df899a0d54e433c1e5efeaea2105b25'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.91.2/tbls_v1.91.2_linux_arm64.tar.gz'
      sha256 '45132dd9928bc53870caff7ff2886e9cf29512bea03c1f98d86fa1d41589abf7'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.91.2/tbls_v1.91.2_linux_amd64.tar.gz'
      sha256 '885481ef894971ce02e645e4a63ad138c4164853c20f65bf6297f21dd6d39a2e'
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
