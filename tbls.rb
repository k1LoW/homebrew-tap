class Tbls < Formula
  desc "tbls is a CI-Friendly tool for document a database, written in Go."
  version '1.59.0'
  homepage 'https://github.com/k1LoW/tbls'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.59.0/tbls_v1.59.0_darwin_arm64.zip'
      sha256 '1924a4567f31b7620019eb75d1d44bb96c4aca379de528c071b86e14511ad034'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.59.0/tbls_v1.59.0_darwin_amd64.zip'
      sha256 'bfea89aa616c62d7371ad92c4876e01c7793e6ddceaf02e31a07485aa4103940'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.59.0/tbls_v1.59.0_linux_amd64.tar.gz'
      sha256 'd46e0c8b88d387229a58e78e4b89a213224787dd6f47bc037e002d8e92c51d83'
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
