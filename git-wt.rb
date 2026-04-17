class GitWt < Formula
  desc 'A Git subcommand that makes `git worktree` simple'
  version '0.27.0'
  homepage 'https://github.com/k1LoW/git-wt'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/git-wt/releases/download/v0.27.0/git-wt_v0.27.0_darwin_arm64.zip'
      sha256 'baee33b94813b02fa7c46aededf569c6057dd86789f3a39c81df1b802a2d331e'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/git-wt/releases/download/v0.27.0/git-wt_v0.27.0_darwin_amd64.zip'
      sha256 'b52beb2bc162c6590460ef73f54b53d977a39d2571862330ef0ae07fce971e60'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/git-wt/releases/download/v0.27.0/git-wt_v0.27.0_linux_arm64.tar.gz'
      sha256 '947e8a7893279bbc6de890300d36b10f6eaae6438e21de20c4291ba528f6201a'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/git-wt/releases/download/v0.27.0/git-wt_v0.27.0_linux_amd64.tar.gz'
      sha256 'a8e264b85ff594ad911c5f7aecd957255af46789959bb3c9fae0f105f1aff9ec'
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
