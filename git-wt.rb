class GitWt < Formula
  desc 'A Git subcommand that makes `git worktree` simple'
  version '0.16.0'
  homepage 'https://github.com/k1LoW/git-wt'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/git-wt/releases/download/v0.16.0/git-wt_v0.16.0_darwin_arm64.zip'
      sha256 '2000755e756326e26202be624f2cc5ce8bd991e5f89b536454a22b2d8dfb7ff7'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/git-wt/releases/download/v0.16.0/git-wt_v0.16.0_darwin_amd64.zip'
      sha256 '81c044f1089217a7bb53db68b91dfb8baf928318cabf59431fdfa08290f33344'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/git-wt/releases/download/v0.16.0/git-wt_v0.16.0_linux_arm64.tar.gz'
      sha256 '8dfa72753ca9f68591860e428d7ad569ecd2c163df0105793def014943d72d75'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/git-wt/releases/download/v0.16.0/git-wt_v0.16.0_linux_amd64.tar.gz'
      sha256 '7d13d37733ae1eea6064baa7cc932f63603ca01c275fd21ec6bf1a12cf99fa59'
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
