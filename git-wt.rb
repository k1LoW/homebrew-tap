class GitWt < Formula
  desc 'A Git subcommand that makes `git worktree` simple'
  version '0.9.1'
  homepage 'https://github.com/k1LoW/git-wt'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/git-wt/releases/download/v0.9.1/git-wt_v0.9.1_darwin_arm64.zip'
      sha256 '8113172bed4eb854f02ccba87b61d09819de0915b484cc201937ba466c236d9f'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/git-wt/releases/download/v0.9.1/git-wt_v0.9.1_darwin_amd64.zip'
      sha256 '558cc904e8572f63b75a498e0032bd200c1248753d8973111dbc6ac010cc07e7'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/git-wt/releases/download/v0.9.1/git-wt_v0.9.1_linux_arm64.tar.gz'
      sha256 '5a5ee276a739e7ac8c6b5d8c9eaf785045b5dc3ed82519f27f9deb88c26f680b'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/git-wt/releases/download/v0.9.1/git-wt_v0.9.1_linux_amd64.tar.gz'
      sha256 '116232615ade688786abd1864939d40ccb7b31eb3e8d88f4356233c63a1060dd'
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
