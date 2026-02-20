class GitWt < Formula
  desc 'A Git subcommand that makes `git worktree` simple'
  version '0.25.0'
  homepage 'https://github.com/k1LoW/git-wt'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/git-wt/releases/download/v0.25.0/git-wt_v0.25.0_darwin_arm64.zip'
      sha256 '5c7fa79fe9c52a2617de86f8f2d5b8eb43056c4c7bcd9341f5b44d90a70c7ca4'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/git-wt/releases/download/v0.25.0/git-wt_v0.25.0_darwin_amd64.zip'
      sha256 'd2d387c5dbafd46d90de7a6906d1ee3df3acfa83c8c9c7a945db63d4e6e0f044'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/git-wt/releases/download/v0.25.0/git-wt_v0.25.0_linux_arm64.tar.gz'
      sha256 '7cac03d1123c943833388cfd104eed2fa36cc76ae0afca7442480d3f827176cc'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/git-wt/releases/download/v0.25.0/git-wt_v0.25.0_linux_amd64.tar.gz'
      sha256 '3d2740c22f7b0ddd469425d3656166c169bd5338688a05572e29d1399e1a945a'
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
