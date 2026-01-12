class GitWt < Formula
  desc 'A Git subcommand that makes `git worktree` simple'
  version '0.13.0'
  homepage 'https://github.com/k1LoW/git-wt'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/git-wt/releases/download/v0.13.0/git-wt_v0.13.0_darwin_arm64.zip'
      sha256 'd596ce05782837b430b378de7a4b19140fbb47c81077ecab1498f0ef5d43e363'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/git-wt/releases/download/v0.13.0/git-wt_v0.13.0_darwin_amd64.zip'
      sha256 'dccb91242cc08d91270fa835b8beda9cbc3e7faf4bce971ece0e2d27eac91075'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/git-wt/releases/download/v0.13.0/git-wt_v0.13.0_linux_arm64.tar.gz'
      sha256 '1b7af0ac8f825dbf21dd0f886909e21748955baf80c82a18e1f197d26df532fb'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/git-wt/releases/download/v0.13.0/git-wt_v0.13.0_linux_amd64.tar.gz'
      sha256 '3360a37373f18e8cfe07c5acd9305bf95a92767f763fc5e5f82146d58e10844a'
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
