class GitWt < Formula
  desc 'A Git subcommand that makes `git worktree` simple'
  version '0.5.1'
  homepage 'https://github.com/k1LoW/git-wt'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/git-wt/releases/download/v0.5.1/git-wt_v0.5.1_darwin_arm64.zip'
      sha256 '780a24be71d08ac219db61dce3cdea2a1551d3a64b031f919c943f795f6fd839'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/git-wt/releases/download/v0.5.1/git-wt_v0.5.1_darwin_amd64.zip'
      sha256 '4b18125e4172f6d3a372e320ce2efe191784a912993ffb04e336580a62ea93e9'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/git-wt/releases/download/v0.5.1/git-wt_v0.5.1_linux_arm64.tar.gz'
      sha256 '2abeae67a517ba54bdd94efc726311b20fb931cc653e1f9352b931759c652064'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/git-wt/releases/download/v0.5.1/git-wt_v0.5.1_linux_amd64.tar.gz'
      sha256 '1cbabb55834ab876923e345599d269d2fd76422add9d31d8400307c709c04ba8'
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
