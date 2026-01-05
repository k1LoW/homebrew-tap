class GitWt < Formula
  desc 'A Git subcommand that makes `git worktree` simple'
  version '0.9.0'
  homepage 'https://github.com/k1LoW/git-wt'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/git-wt/releases/download/v0.9.0/git-wt_v0.9.0_darwin_arm64.zip'
      sha256 '3f92335ab789245faa0f83d3a2ecdb613aafeefc01f561fe06a8d98aebab4415'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/git-wt/releases/download/v0.9.0/git-wt_v0.9.0_darwin_amd64.zip'
      sha256 '22d0cd3355b4f8e93fb12e3aa4ddf147052fc78ece6fecd22cc41b3c6518fa95'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/git-wt/releases/download/v0.9.0/git-wt_v0.9.0_linux_arm64.tar.gz'
      sha256 '796ccbac9d5345ee14e3d550afe0ced052fec2f7e2cf3a8e20504ee349a93f3e'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/git-wt/releases/download/v0.9.0/git-wt_v0.9.0_linux_amd64.tar.gz'
      sha256 '23d99b17d37dc1231e90280ecd56c5e8977caf8cc0f69c81e6fbc1282f601118'
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
