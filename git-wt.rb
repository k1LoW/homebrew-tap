class GitWt < Formula
  desc 'A Git subcommand that makes `git worktree` simple'
  version '0.8.2'
  homepage 'https://github.com/k1LoW/git-wt'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/git-wt/releases/download/v0.8.2/git-wt_v0.8.2_darwin_arm64.zip'
      sha256 '86f261e60172d2ebd2cfc14bfea38ca98bf55d8bae29f47d96163b0bae67c131'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/git-wt/releases/download/v0.8.2/git-wt_v0.8.2_darwin_amd64.zip'
      sha256 '24c92a291098819c9309d3929471e99315e501a84201e3d6c25130ac01a3f87a'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/git-wt/releases/download/v0.8.2/git-wt_v0.8.2_linux_arm64.tar.gz'
      sha256 '4bdda0f5e9dde27dbcb91c80f743abd617cf912fba21c15021d12b1d864c052c'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/git-wt/releases/download/v0.8.2/git-wt_v0.8.2_linux_amd64.tar.gz'
      sha256 '35df02482d22c795a2b14f4c855d6b75ef7813289612e39047737599c0c442fd'
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
