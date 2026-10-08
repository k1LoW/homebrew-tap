class GitWt < Formula
  desc 'A Git subcommand that makes `git worktree` simple'
  version '0.30.0'
  homepage 'https://github.com/k1LoW/git-wt'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/git-wt/releases/download/v0.30.0/git-wt_v0.30.0_darwin_arm64.zip'
      sha256 '0c33e54250ebfdd84975f299233299d3d5dd2e61caa5416637fbbf34daab5bab'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/git-wt/releases/download/v0.30.0/git-wt_v0.30.0_darwin_amd64.zip'
      sha256 'a49321661c6b8925a946aaaf0d00fe4a77e470fcb7a9640a0b86aabdd3b2583a'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/git-wt/releases/download/v0.30.0/git-wt_v0.30.0_linux_arm64.tar.gz'
      sha256 '92f63c58bda5b1046df70776570cb61671fc831495f5580d95d09182799019c3'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/git-wt/releases/download/v0.30.0/git-wt_v0.30.0_linux_amd64.tar.gz'
      sha256 '6bcd840851d0a1e90b6227139e919266c4340b1d5b0bc6c84f2cea7aa5d3ffd3'
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
