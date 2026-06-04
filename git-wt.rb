class GitWt < Formula
  desc 'A Git subcommand that makes `git worktree` simple'
  version '0.29.0'
  homepage 'https://github.com/k1LoW/git-wt'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/git-wt/releases/download/v0.29.0/git-wt_v0.29.0_darwin_arm64.zip'
      sha256 '4cf0a9bf8d6b63f75788c60b7d90cb2079c86cd41207d34820ab82d67f08ce8c'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/git-wt/releases/download/v0.29.0/git-wt_v0.29.0_darwin_amd64.zip'
      sha256 'c010cbf5d5aeccde6e3f86b2caaeff172fe830e2a8e0a81f5146380fb6b05013'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/git-wt/releases/download/v0.29.0/git-wt_v0.29.0_linux_arm64.tar.gz'
      sha256 'bd1074cfa43476ae1ecdc5f15792ba9f5446fc03ffc5bbc4edf102e08abeaf8c'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/git-wt/releases/download/v0.29.0/git-wt_v0.29.0_linux_amd64.tar.gz'
      sha256 '5d04c89ce105a63edb38c89c17813bfc902dbc20ca20f27c44948cbfe6b055f8'
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
