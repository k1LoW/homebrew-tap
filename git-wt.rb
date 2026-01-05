class GitWt < Formula
  desc 'A Git subcommand that makes `git worktree` simple'
  version '0.8.1'
  homepage 'https://github.com/k1LoW/git-wt'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/git-wt/releases/download/v0.8.1/git-wt_v0.8.1_darwin_arm64.zip'
      sha256 '1ef8e9a7e570f9bb61f82f5ddbcec46161674f6035660fae2d8ef7e36ddbcbcf'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/git-wt/releases/download/v0.8.1/git-wt_v0.8.1_darwin_amd64.zip'
      sha256 'd0a9579659fb766b5907e7d16797982b3d43a3249fc59c636eb79ee39e39a43b'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/git-wt/releases/download/v0.8.1/git-wt_v0.8.1_linux_arm64.tar.gz'
      sha256 'bf108367f74ecae2f988e053cbf714430044fbd421ac1676116da032bd675732'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/git-wt/releases/download/v0.8.1/git-wt_v0.8.1_linux_amd64.tar.gz'
      sha256 '8fca0e742a053b03e9fdef43336d73c26e42818cdb74a9d908781245c248199b'
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
