class GitWt < Formula
  desc 'A Git subcommand that makes `git worktree` simple'
  version '0.6.0'
  homepage 'https://github.com/k1LoW/git-wt'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/git-wt/releases/download/v0.6.0/git-wt_v0.6.0_darwin_arm64.zip'
      sha256 'd8961502b98593693a326bef7496fa012ca54a0ed235f5db48ea88e54153251a'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/git-wt/releases/download/v0.6.0/git-wt_v0.6.0_darwin_amd64.zip'
      sha256 '243983c74141ff4e179ddf46fcf56bf56e24d63aba3703e203c4292b54e349a5'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/git-wt/releases/download/v0.6.0/git-wt_v0.6.0_linux_arm64.tar.gz'
      sha256 'f1620be6a52080c7cff7bcf118f34db85c5e9f647be0ebae0d85f0ed2d55ea20'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/git-wt/releases/download/v0.6.0/git-wt_v0.6.0_linux_amd64.tar.gz'
      sha256 'c3047e2707e4ef1def2f92d793e98afa6d4f680f412af6a6aa2d3d7570eff46e'
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
