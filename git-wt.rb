class GitWt < Formula
  desc 'A Git subcommand that makes `git worktree` simple'
  version '0.29.1'
  homepage 'https://github.com/k1LoW/git-wt'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/git-wt/releases/download/v0.29.1/git-wt_v0.29.1_darwin_arm64.zip'
      sha256 '9fccd453cb5c7f33a5ea079b659291d03d052eb57eb3daf2c8aac5f539c9e290'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/git-wt/releases/download/v0.29.1/git-wt_v0.29.1_darwin_amd64.zip'
      sha256 '130ed324b7c9d8ff5b1a677664605e549f8577248abe50b9eef0077598f5dfa0'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/git-wt/releases/download/v0.29.1/git-wt_v0.29.1_linux_arm64.tar.gz'
      sha256 '8416f674ec29ac19d26045369fda77013d105a7c82c0699f010f44582fdc6860'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/git-wt/releases/download/v0.29.1/git-wt_v0.29.1_linux_amd64.tar.gz'
      sha256 '37178ebc756598a9b28e76ef65e8931226a5faf9784b72b1596bdb0e7c15bb23'
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
