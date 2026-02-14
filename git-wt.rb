class GitWt < Formula
  desc 'A Git subcommand that makes `git worktree` simple'
  version '0.21.0'
  homepage 'https://github.com/k1LoW/git-wt'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/git-wt/releases/download/v0.21.0/git-wt_v0.21.0_darwin_arm64.zip'
      sha256 'e3652dde356bb942086ea852eda6833fab044c987c076265a582bc48d6f30c38'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/git-wt/releases/download/v0.21.0/git-wt_v0.21.0_darwin_amd64.zip'
      sha256 '2fcd2e5f3dffe80b1e2985cbec0001b6cab0f1ad4c71db8c80566c1033bcf6e5'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/git-wt/releases/download/v0.21.0/git-wt_v0.21.0_linux_arm64.tar.gz'
      sha256 '97f9eee294550e5ae41a7bf2567f75db1025b9e9a80774780ba25b6a3ba6be9b'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/git-wt/releases/download/v0.21.0/git-wt_v0.21.0_linux_amd64.tar.gz'
      sha256 '2b817e887ed17003b57faa7be9b16366cca15c4f60cf8800ac239178985dfb19'
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
