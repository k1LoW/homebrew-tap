class GitWt < Formula
  desc 'A Git subcommand that makes `git worktree` simple'
  version '0.16.1'
  homepage 'https://github.com/k1LoW/git-wt'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/git-wt/releases/download/v0.16.1/git-wt_v0.16.1_darwin_arm64.zip'
      sha256 'c67ea11b1d797f297b2c9a709a4b61bf08c0feddb2690307531af3a834929b1e'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/git-wt/releases/download/v0.16.1/git-wt_v0.16.1_darwin_amd64.zip'
      sha256 'dd89da7626b7f4335254febf428b6af5e52dfdf1260f3883ef86d9790d0e1f9c'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/git-wt/releases/download/v0.16.1/git-wt_v0.16.1_linux_arm64.tar.gz'
      sha256 '6b344e7ffc0136419219913ffd6a03703440f3fdcfce6e90b5829641977061c9'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/git-wt/releases/download/v0.16.1/git-wt_v0.16.1_linux_amd64.tar.gz'
      sha256 'e9891fdaeaac3b78c6fb9e81142237f2583d95da16e153bccc3414a94536a8ce'
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
