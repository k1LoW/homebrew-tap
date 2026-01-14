class GitWt < Formula
  desc 'A Git subcommand that makes `git worktree` simple'
  version '0.13.1'
  homepage 'https://github.com/k1LoW/git-wt'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/git-wt/releases/download/v0.13.1/git-wt_v0.13.1_darwin_arm64.zip'
      sha256 'd18c80c36c7821e26b99d839c472625e58e77f31a1d8299006aaec31c817b02d'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/git-wt/releases/download/v0.13.1/git-wt_v0.13.1_darwin_amd64.zip'
      sha256 'f2382f8076c0079dbbe0b9e5d683d2495104782e0cd28f5e7cfbbf1c12f91b66'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/git-wt/releases/download/v0.13.1/git-wt_v0.13.1_linux_arm64.tar.gz'
      sha256 '905b597ee27c62720a80ff8300e27e05d36f44d5e6efabd912525c67b1ed51fb'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/git-wt/releases/download/v0.13.1/git-wt_v0.13.1_linux_amd64.tar.gz'
      sha256 'd0faee5b9f1c13d7486e5d1e5b14237e5a6415e317b9a70d7da26dbd83d0eb80'
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
