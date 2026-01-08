class GitWt < Formula
  desc 'A Git subcommand that makes `git worktree` simple'
  version '0.12.1'
  homepage 'https://github.com/k1LoW/git-wt'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/git-wt/releases/download/v0.12.1/git-wt_v0.12.1_darwin_arm64.zip'
      sha256 '5ffcd0b7ecf9ce603e5fd5449bab4ab242aa5c0e549e45934e4c6f88d63da5d7'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/git-wt/releases/download/v0.12.1/git-wt_v0.12.1_darwin_amd64.zip'
      sha256 'b355ee12c9c27b321a3c235cf3f2448a60aa653dcd78b45f3d99ec0fbe5e9fb8'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/git-wt/releases/download/v0.12.1/git-wt_v0.12.1_linux_arm64.tar.gz'
      sha256 'eb30f4ac2ea1443abfdfd584e050cc22cf349a7be9aa4b07c79eaf5985204684'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/git-wt/releases/download/v0.12.1/git-wt_v0.12.1_linux_amd64.tar.gz'
      sha256 'fd6e761fa116c941b7ef5d12c7c9b7085b0584adfaee7da5a936909d4093cb5c'
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
