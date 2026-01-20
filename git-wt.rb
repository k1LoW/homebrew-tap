class GitWt < Formula
  desc 'A Git subcommand that makes `git worktree` simple'
  version '0.14.2'
  homepage 'https://github.com/k1LoW/git-wt'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/git-wt/releases/download/v0.14.2/git-wt_v0.14.2_darwin_arm64.zip'
      sha256 '8174ebc140693103c964b4cd992b277012f2307eb72b01da72d576234ac20ca9'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/git-wt/releases/download/v0.14.2/git-wt_v0.14.2_darwin_amd64.zip'
      sha256 'f62f63fbfbca444be5c7c55676a534b705a5add1e80bd877031bb55379f28c27'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/git-wt/releases/download/v0.14.2/git-wt_v0.14.2_linux_arm64.tar.gz'
      sha256 '93a5de5704f81352820d09a4bdc147102637b6165bb9d3c0b72cca6d9907709a'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/git-wt/releases/download/v0.14.2/git-wt_v0.14.2_linux_amd64.tar.gz'
      sha256 '5af2a8a839dccd60b7e25a1d8e00de9574213a0a4264b636a7f773278e6c7faf'
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
