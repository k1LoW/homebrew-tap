class Tbls < Formula
  desc 'tbls is a CI-Friendly tool for document a database, written in Go.'
  version '1.90.0'
  homepage 'https://github.com/k1LoW/tbls'

  deprecate! date: "2025-08-02", because: "please use the official Homebrew formula instead"

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.90.0/tbls_v1.90.0_darwin_arm64.zip'
      sha256 '1befbd394f7ae02f1c965e40a0a09c480c5033bc0ba648082f7dc85aa79ccd17'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.90.0/tbls_v1.90.0_darwin_amd64.zip'
      sha256 '5c3667fcac335cf81b2a063c424c4517107b0be40ed70cb227bc7ae4aefd0935'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.90.0/tbls_v1.90.0_linux_arm64.tar.gz'
      sha256 'dad024f0c2bf8e39e5531911adb54ffa7016a696a0382c3e130a282ff1be775f'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.90.0/tbls_v1.90.0_linux_amd64.tar.gz'
      sha256 'ed1772b976e61069ef4b0475f3550ed63ccb565ce941605fd47bdb1ba35e40c4'
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
