class GitWt < Formula
  desc 'A Git subcommand that makes `git worktree` simple'
  version '0.29.2'
  homepage 'https://github.com/k1LoW/git-wt'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/git-wt/releases/download/v0.29.2/git-wt_v0.29.2_darwin_arm64.zip'
      sha256 'ec72a30f100e1b319ef41635ef1ddaa789f7ae01b427849da161d463876beda9'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/git-wt/releases/download/v0.29.2/git-wt_v0.29.2_darwin_amd64.zip'
      sha256 'f88b2dd0ac502fb838931922574cc52738638b2de76d4fead011d6610400694f'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/git-wt/releases/download/v0.29.2/git-wt_v0.29.2_linux_arm64.tar.gz'
      sha256 'dca427f13fe6834006cfed7f755049f24fa9c40eb4b986de14495f1174fad00c'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/git-wt/releases/download/v0.29.2/git-wt_v0.29.2_linux_amd64.tar.gz'
      sha256 '68e32aead46a490eaef884d35da7e003e5166cc82ffff91347756d5deafa90b7'
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
