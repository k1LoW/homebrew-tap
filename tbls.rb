class Tbls < Formula
  desc 'tbls is a CI-Friendly tool for document a database, written in Go.'
  version '1.91.3'
  homepage 'https://github.com/k1LoW/tbls'

  deprecate! date: "2025-08-02", because: "please use the official Homebrew formula instead"

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.91.3/tbls_v1.91.3_darwin_arm64.zip'
      sha256 '1d6b1370ca90934e7cf7ef413d27bc06ae0b121ebaebc2bd7ebcca597a6885fc'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.91.3/tbls_v1.91.3_darwin_amd64.zip'
      sha256 '476651e89c05e710ebcd5f927a3b33ff2414175303b4c19f6da8d70475a2a0dd'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.91.3/tbls_v1.91.3_linux_arm64.tar.gz'
      sha256 '9a2c4b64ec8b334e23f80cc71bcdd105d7cbacce160f2c6089792e06ac89abe1'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.91.3/tbls_v1.91.3_linux_amd64.tar.gz'
      sha256 '592f5ea0765f06cf0fb1eeb6d105f376c11e49fa6cad5b27e67c86acb482c875'
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
