class GitWt < Formula
  desc 'A Git subcommand that makes `git worktree` simple'
  version '0.10.0'
  homepage 'https://github.com/k1LoW/git-wt'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/git-wt/releases/download/v0.10.0/git-wt_v0.10.0_darwin_arm64.zip'
      sha256 'd2f287e6587f94c685d7388e8bf6b5200ff4bcb7e55edb3872dca52711dc003c'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/git-wt/releases/download/v0.10.0/git-wt_v0.10.0_darwin_amd64.zip'
      sha256 '5e24992462d68aea1e19c017de80adfa3de7cf3f3b0e33a4aa72ad608f0a23a4'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/git-wt/releases/download/v0.10.0/git-wt_v0.10.0_linux_arm64.tar.gz'
      sha256 '1a847cc82fa57742f05bfa6bb3e09b5749c94680a6907235484c84324763b7ed'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/git-wt/releases/download/v0.10.0/git-wt_v0.10.0_linux_amd64.tar.gz'
      sha256 'a969f3f349a36a5629054c0a617c1f2f128361565e07631cd438a7cfb4cfd2b7'
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
