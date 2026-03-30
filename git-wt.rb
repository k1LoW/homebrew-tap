class GitWt < Formula
  desc 'A Git subcommand that makes `git worktree` simple'
  version '0.26.0'
  homepage 'https://github.com/k1LoW/git-wt'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/git-wt/releases/download/v0.26.0/git-wt_v0.26.0_darwin_arm64.zip'
      sha256 '5e39f3df1357d92a7c1b1e9fbb10b852a7249649f7fa8622e328f76ead851a6a'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/git-wt/releases/download/v0.26.0/git-wt_v0.26.0_darwin_amd64.zip'
      sha256 'ecc17eb1e0aba5aa83a7225a20cd36119a402bd7ff9292add2f76b0365482b37'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/git-wt/releases/download/v0.26.0/git-wt_v0.26.0_linux_arm64.tar.gz'
      sha256 '0757edc483ea37b86f3763da9b420476bf4f888e99d846312a0f2a9fec75b508'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/git-wt/releases/download/v0.26.0/git-wt_v0.26.0_linux_amd64.tar.gz'
      sha256 '3184ae1b79b5eec6f842dc3aaa6055c8442c6acb777de49f2b47bd7d9678cfca'
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
