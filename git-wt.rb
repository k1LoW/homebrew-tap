class GitWt < Formula
  desc 'A Git subcommand that makes `git worktree` simple'
  version '0.24.0'
  homepage 'https://github.com/k1LoW/git-wt'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/git-wt/releases/download/v0.24.0/git-wt_v0.24.0_darwin_arm64.zip'
      sha256 'e2d93b66bd24053ebd8c31eee5d0c52bac1b900aebcbcb8907a12b82980b703e'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/git-wt/releases/download/v0.24.0/git-wt_v0.24.0_darwin_amd64.zip'
      sha256 'cca6f4e9db63894b9ec8de4551b290d68bf73b475a1fac5f43f9d666d017ff62'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/git-wt/releases/download/v0.24.0/git-wt_v0.24.0_linux_arm64.tar.gz'
      sha256 'bb1554b8806123e32bd354a70832b342b9a60ddbd5fcd2b0bbe4dabeaaf7ff33'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/git-wt/releases/download/v0.24.0/git-wt_v0.24.0_linux_amd64.tar.gz'
      sha256 'e0fbbabc4aa64c62a1ff24138c1a09d3f3c5b60bd5342f043c61aa24a5a0dbee'
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
