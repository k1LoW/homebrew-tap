class GitWt < Formula
  desc 'A Git subcommand that makes `git worktree` simple'
  version '0.18.0'
  homepage 'https://github.com/k1LoW/git-wt'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/git-wt/releases/download/v0.18.0/git-wt_v0.18.0_darwin_arm64.zip'
      sha256 'b56534b1b0f8dc8f0267e1815653a205586ee45b59a664f212ad49a31da78b19'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/git-wt/releases/download/v0.18.0/git-wt_v0.18.0_darwin_amd64.zip'
      sha256 '36340e4226f05beacc67d7fd8dcf5a5ec6d9d22f4d4302090dc19137a5bf154e'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/git-wt/releases/download/v0.18.0/git-wt_v0.18.0_linux_arm64.tar.gz'
      sha256 '7f50760f88e3b8e412f35e3d4f081e7bdbbd6496213192b03f47fc39cdc9eb12'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/git-wt/releases/download/v0.18.0/git-wt_v0.18.0_linux_amd64.tar.gz'
      sha256 '1580f6d5cd3d34ee18f4d64fd69f27c8070a54e61ded8b382fd19ea717d4bb4a'
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
