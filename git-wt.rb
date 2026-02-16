class GitWt < Formula
  desc 'A Git subcommand that makes `git worktree` simple'
  version '0.23.0'
  homepage 'https://github.com/k1LoW/git-wt'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/git-wt/releases/download/v0.23.0/git-wt_v0.23.0_darwin_arm64.zip'
      sha256 '6abe27b182a40ec9fe5d330f2f5550d615f99ee61055d7dc84d4d3ed43b89675'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/git-wt/releases/download/v0.23.0/git-wt_v0.23.0_darwin_amd64.zip'
      sha256 '72b1c798a099884b06434fa0eb20553e9fef86c09c960e5eb56343f69185b3ed'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/git-wt/releases/download/v0.23.0/git-wt_v0.23.0_linux_arm64.tar.gz'
      sha256 '99b9c2ef5d543cf686eb85f5e7e2d38d92937a0efefd388e8df82a713c954e89'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/git-wt/releases/download/v0.23.0/git-wt_v0.23.0_linux_amd64.tar.gz'
      sha256 'ea26cfe207133a99695da4aa5dcbe271b6435ab227280817d3530d4b9afdd3d9'
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
