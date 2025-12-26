class GitWt < Formula
  desc 'A Git subcommand that makes `git worktree` simple'
  version '0.2.0'
  homepage 'https://github.com/k1LoW/git-wt'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/git-wt/releases/download/v0.2.0/git-wt_v0.2.0_darwin_arm64.zip'
      sha256 'fccb4dcc3add97a2948d590cf84dffd6fc5d3731340ee25efb430115bd47ac79'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/git-wt/releases/download/v0.2.0/git-wt_v0.2.0_darwin_amd64.zip'
      sha256 '056f3680bdcf36491386b6de25493957be2da7253ecddf0588eea10f941b8494'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/git-wt/releases/download/v0.2.0/git-wt_v0.2.0_linux_arm64.tar.gz'
      sha256 '4262e6d68d123b376cb579728a3b379d44e82065686432e8dce32364c8a48875'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/git-wt/releases/download/v0.2.0/git-wt_v0.2.0_linux_amd64.tar.gz'
      sha256 'bf54c96335f42470a893bedd2d3799e6b41317ae66180989a5e9438cc3eb9a40'
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
