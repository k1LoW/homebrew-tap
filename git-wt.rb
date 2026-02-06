class GitWt < Formula
  desc 'A Git subcommand that makes `git worktree` simple'
  version '0.19.0'
  homepage 'https://github.com/k1LoW/git-wt'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/git-wt/releases/download/v0.19.0/git-wt_v0.19.0_darwin_arm64.zip'
      sha256 '28e5e3515777178661fb07afc3a7018b3c4c4629cc13cbd25bf82a3ceed19985'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/git-wt/releases/download/v0.19.0/git-wt_v0.19.0_darwin_amd64.zip'
      sha256 '6d343742b522cc29bed3d580fcfdbbd626ff76224a69ecbc4429d3b1856a4a57'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/git-wt/releases/download/v0.19.0/git-wt_v0.19.0_linux_arm64.tar.gz'
      sha256 'faddf98b68c8e12f9c98683ec1f784a802f7e9a1d66d5014055270ad00dc67c0'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/git-wt/releases/download/v0.19.0/git-wt_v0.19.0_linux_amd64.tar.gz'
      sha256 'e43b87784823cdf60883374900d1c8f5814c8c117431293bdf7807dccd8be98f'
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
