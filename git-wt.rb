class GitWt < Formula
  desc 'A Git subcommand that makes `git worktree` simple'
  version '0.7.0'
  homepage 'https://github.com/k1LoW/git-wt'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/git-wt/releases/download/v0.7.0/git-wt_v0.7.0_darwin_arm64.zip'
      sha256 '6ddfa4aae0ef89cad58320131ef861a6eb9f752056892bfb88d8eb218ad9d0a3'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/git-wt/releases/download/v0.7.0/git-wt_v0.7.0_darwin_amd64.zip'
      sha256 '40821acf518b7aa31f73e76f2232946c26b62ce040e5748b1f31022481030944'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/git-wt/releases/download/v0.7.0/git-wt_v0.7.0_linux_arm64.tar.gz'
      sha256 '9cc46159ef160c1db546b08f6658a37bd7c547fa38cd2d5f6cf31f63a3684fd8'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/git-wt/releases/download/v0.7.0/git-wt_v0.7.0_linux_amd64.tar.gz'
      sha256 'd0d316aba174bd4959ead310a6130de067aa4e7a432b263717d5f8002e64b5dd'
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
