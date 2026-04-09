class Tbls < Formula
  desc 'tbls is a CI-Friendly tool for document a database, written in Go.'
  version '1.94.4'
  homepage 'https://github.com/k1LoW/tbls'

  deprecate! date: "2025-08-02", because: "please use the official Homebrew formula instead"

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.94.4/tbls_v1.94.4_darwin_arm64.zip'
      sha256 '7744dc1b3479183ca4e33860a135251f57c0aec0e2c5275280a99593c708d22a'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.94.4/tbls_v1.94.4_darwin_amd64.zip'
      sha256 '51a9419bb6e05d15113afc9ae304f1373c69dccdd1f0bf8e97fd822288bdfd87'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.94.4/tbls_v1.94.4_linux_arm64.tar.gz'
      sha256 '06e725db4abcdbd4271826610137c2a9a79e70dd8cab0acdc09a4ea52c66b001'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.94.4/tbls_v1.94.4_linux_amd64.tar.gz'
      sha256 'd054c2c48cbe57c082303938beae40dff7dd49d7b40403ab878dabb97af08c15'
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
