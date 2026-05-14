class GitWt < Formula
  desc 'A Git subcommand that makes `git worktree` simple'
  version '0.28.0'
  homepage 'https://github.com/k1LoW/git-wt'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/git-wt/releases/download/v0.28.0/git-wt_v0.28.0_darwin_arm64.zip'
      sha256 'd572f212688278ba45f39f7460d29905ad0ea0a262b383124cfc21e5e9bc0f52'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/git-wt/releases/download/v0.28.0/git-wt_v0.28.0_darwin_amd64.zip'
      sha256 '7f4b9371b4d20026e91c8ad148df77747bcc4742bc7b2eafdea65fad63f76700'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/git-wt/releases/download/v0.28.0/git-wt_v0.28.0_linux_arm64.tar.gz'
      sha256 'b3230c06165a0045328be66ed04828f8219e6ec793b531d74e90d38c4d78445e'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/git-wt/releases/download/v0.28.0/git-wt_v0.28.0_linux_amd64.tar.gz'
      sha256 'd70b9c2db08d062b8c37a8aaf8766c07434f91fc8414c90430aee013533aac02'
    end
  end

  head do
    url 'https://github.com/k1LoW/git-wt.git'
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    bin.install 'git-wt'
  end
end
