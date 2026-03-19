class Tbls < Formula
  desc 'tbls is a CI-Friendly tool for document a database, written in Go.'
  version '1.93.0'
  homepage 'https://github.com/k1LoW/tbls'

  deprecate! date: "2025-08-02", because: "please use the official Homebrew formula instead"

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.93.0/tbls_v1.93.0_darwin_arm64.zip'
      sha256 'da7166841b52bcaf801412811b670beaa08c23a10e123bfa6a867dc2e020ec6d'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.93.0/tbls_v1.93.0_darwin_amd64.zip'
      sha256 '6a09fa98670111059f2c38da94b68c705b736506db1ca951aef72525e9f2ebb1'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.93.0/tbls_v1.93.0_linux_arm64.tar.gz'
      sha256 '6b0429e601b1cf9952488ae3ba856816d0ceda35f7ada30ea7410cfa0dc32e17'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.93.0/tbls_v1.93.0_linux_amd64.tar.gz'
      sha256 '75083768d6305e46322395ee1a12f6a2d2a99d02552a75a940410cdf00573c97'
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
