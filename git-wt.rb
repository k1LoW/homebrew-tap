class GitWt < Formula
  desc 'A Git subcommand that makes `git worktree` simple'
  version '0.15.0'
  homepage 'https://github.com/k1LoW/git-wt'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/git-wt/releases/download/v0.15.0/git-wt_v0.15.0_darwin_arm64.zip'
      sha256 'a6c07c6338bcb31a8d71dec9fb961d01716e1ff7f54a6dc5846551335ab9e571'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/git-wt/releases/download/v0.15.0/git-wt_v0.15.0_darwin_amd64.zip'
      sha256 '2c8e1e7ff6f9ca44b550f743bd2246cfcd4b6236d9dc089c22e37d1874ccb35b'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/git-wt/releases/download/v0.15.0/git-wt_v0.15.0_linux_arm64.tar.gz'
      sha256 '269e6ff231c84ad139b1350a8838dd6bf32d5262b48c04b6751e5c306597e2ba'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/git-wt/releases/download/v0.15.0/git-wt_v0.15.0_linux_amd64.tar.gz'
      sha256 'c13442fef2ba65e43b57374311709ccd50ee20c9c15b5f76fc02c406ae553f88'
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
