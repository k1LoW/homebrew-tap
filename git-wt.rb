class GitWt < Formula
  desc 'A Git subcommand that makes `git worktree` simple'
  version '0.12.0'
  homepage 'https://github.com/k1LoW/git-wt'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/git-wt/releases/download/v0.12.0/git-wt_v0.12.0_darwin_arm64.zip'
      sha256 'e83af305f02b513f3aa1122204ec5c76ed9c37ebdf7d301c49fc865922a009ba'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/git-wt/releases/download/v0.12.0/git-wt_v0.12.0_darwin_amd64.zip'
      sha256 '71e4a336ddd50d53990b7adf3ee19b02aba4b8e8cd25d100f5169ec7de8c7dfc'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/git-wt/releases/download/v0.12.0/git-wt_v0.12.0_linux_arm64.tar.gz'
      sha256 '2048cec83d41614c8accddbd6d046e6bbf65f802ba5551423048db291e663a87'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/git-wt/releases/download/v0.12.0/git-wt_v0.12.0_linux_amd64.tar.gz'
      sha256 'ed12aa6a9aea35f0dbaa1383b7b667e154e3088939d9bec8d202809b9d287f5e'
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
