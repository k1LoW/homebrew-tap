class GitWt < Formula
  desc 'A Git subcommand that makes `git worktree` simple'
  version '0.20.0'
  homepage 'https://github.com/k1LoW/git-wt'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/git-wt/releases/download/v0.20.0/git-wt_v0.20.0_darwin_arm64.zip'
      sha256 '364d04fd1dcc54ff0e5b91ef75ebbf94a01bdb2dfb426b565d5cfef34a83a943'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/git-wt/releases/download/v0.20.0/git-wt_v0.20.0_darwin_amd64.zip'
      sha256 '10f6c98833583be32f3a073bd4f68362b459da215a0941e897311edc29687627'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/git-wt/releases/download/v0.20.0/git-wt_v0.20.0_linux_arm64.tar.gz'
      sha256 '6ffb9e34597fd6e95c30b9c38424a3df60779a036132b772cdc1fc0ee58af556'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/git-wt/releases/download/v0.20.0/git-wt_v0.20.0_linux_amd64.tar.gz'
      sha256 '8252b2781ee5b448d0c341db9cd7065275e5ea0e7a0c104c6518110b136c4ab2'
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
