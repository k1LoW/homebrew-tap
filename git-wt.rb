class GitWt < Formula
  desc 'A Git subcommand that makes `git worktree` simple'
  version '0.18.1'
  homepage 'https://github.com/k1LoW/git-wt'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/git-wt/releases/download/v0.18.1/git-wt_v0.18.1_darwin_arm64.zip'
      sha256 '418765117e6c58d21766eab03545e1637e6250c41f389ab5b9435297b2162657'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/git-wt/releases/download/v0.18.1/git-wt_v0.18.1_darwin_amd64.zip'
      sha256 '9d935795db1fe0d95301070839a6d4ab2031c7fc0f405e8a4f657ea77f40ea54'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/git-wt/releases/download/v0.18.1/git-wt_v0.18.1_linux_arm64.tar.gz'
      sha256 '8bb0645ef8a1f8872f05cdee0d1d2cb2d5c82be0dc95ae191d55b7636bb88017'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/git-wt/releases/download/v0.18.1/git-wt_v0.18.1_linux_amd64.tar.gz'
      sha256 '62c740bfa6c8b22f9d2463ab764ac880493d9061e7cc5383cbc1b6297c4efc7a'
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
