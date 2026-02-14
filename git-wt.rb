class GitWt < Formula
  desc 'A Git subcommand that makes `git worktree` simple'
  version '0.21.1'
  homepage 'https://github.com/k1LoW/git-wt'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/git-wt/releases/download/v0.21.1/git-wt_v0.21.1_darwin_arm64.zip'
      sha256 '4a268ca2a99d5c424105828f481bb8eab57433336b6e736b792e824658c33aca'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/git-wt/releases/download/v0.21.1/git-wt_v0.21.1_darwin_amd64.zip'
      sha256 '77596cca46e91f6f2bff0adb3cd17306cce177fc289fb33400d527151ef1e8a0'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/git-wt/releases/download/v0.21.1/git-wt_v0.21.1_linux_arm64.tar.gz'
      sha256 'f58f48d8745e8aad1d26c8b496599bef1543f6c54cb4d15acb6b6237d02193df'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/git-wt/releases/download/v0.21.1/git-wt_v0.21.1_linux_amd64.tar.gz'
      sha256 '9ac14bebbfaddee71935ca54f8969d0c47ab2cc050d9bf4c0e7c6139f3fdd88d'
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
