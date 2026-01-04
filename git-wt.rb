class GitWt < Formula
  desc 'A Git subcommand that makes `git worktree` simple'
  version '0.5.2'
  homepage 'https://github.com/k1LoW/git-wt'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/git-wt/releases/download/v0.5.2/git-wt_v0.5.2_darwin_arm64.zip'
      sha256 'a41b5ef84035316fdf5aac280f1db1fb1d76982176659b30f9a683010ee0debf'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/git-wt/releases/download/v0.5.2/git-wt_v0.5.2_darwin_amd64.zip'
      sha256 'f417a4764353b1c1c4b996d27e6d4bdf50030fb73e012c37fbdd514b9d20f0a9'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/git-wt/releases/download/v0.5.2/git-wt_v0.5.2_linux_arm64.tar.gz'
      sha256 'fcbad4bf9f7deeb2b00f398cbefc2a899d5f10c7c1b43a2dd08c4818f6373957'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/git-wt/releases/download/v0.5.2/git-wt_v0.5.2_linux_amd64.tar.gz'
      sha256 '7165b8bc5b0826e4578613dd385fca204deabffe57d471bb7d8a7ab45e916a45'
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
