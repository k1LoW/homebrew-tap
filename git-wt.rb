class GitWt < Formula
  desc 'A Git subcommand that makes `git worktree` simple'
  version '0.4.0'
  homepage 'https://github.com/k1LoW/git-wt'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/git-wt/releases/download/v0.4.0/git-wt_v0.4.0_darwin_arm64.zip'
      sha256 '462ee8e7d4c4cdd58b8d933dbf4f96248f684b5fa87ea19cd6bac173f3f714a8'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/git-wt/releases/download/v0.4.0/git-wt_v0.4.0_darwin_amd64.zip'
      sha256 'ce73c6945060f5eb7d4ca719d4aa257e2e27d3f0f4e8ec311cb10140a26450d4'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/git-wt/releases/download/v0.4.0/git-wt_v0.4.0_linux_arm64.tar.gz'
      sha256 '19a76acec5ad771bbfcfc8f599328b56d9a19101f4c6d9a2f166762f7470543b'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/git-wt/releases/download/v0.4.0/git-wt_v0.4.0_linux_amd64.tar.gz'
      sha256 '8be6509d64cd88c978d15c916504bd044bcc4e0306ab8263b84c626d94cbf9a3'
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
