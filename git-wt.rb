class GitWt < Formula
  desc 'A Git subcommand that makes `git worktree` simple'
  version '0.14.1'
  homepage 'https://github.com/k1LoW/git-wt'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/git-wt/releases/download/v0.14.1/git-wt_v0.14.1_darwin_arm64.zip'
      sha256 '8757425de5527b075be93e4443b1a57cd218492120fcfbbe5dc4510748e25cf1'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/git-wt/releases/download/v0.14.1/git-wt_v0.14.1_darwin_amd64.zip'
      sha256 '3390db4d8b641079a67f9c4fc8505b540bbbad6ed25645adecaa79a6527bd0c8'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/git-wt/releases/download/v0.14.1/git-wt_v0.14.1_linux_arm64.tar.gz'
      sha256 'dbf8b2620fad2c8d42b6dd1641a82936b292362fdb294997373fb1a4365ff9ac'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/git-wt/releases/download/v0.14.1/git-wt_v0.14.1_linux_amd64.tar.gz'
      sha256 'c2bfc52d36eaa775dfdc8b578e534229e3ba2fc06e22e25839b776f3746ab81c'
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
