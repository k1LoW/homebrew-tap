class GitWt < Formula
  desc 'A Git subcommand that makes `git worktree` simple'
  version '0.11.0'
  homepage 'https://github.com/k1LoW/git-wt'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/git-wt/releases/download/v0.11.0/git-wt_v0.11.0_darwin_arm64.zip'
      sha256 '355668acb7fca8027437890c0885bec568eb425913db6f5ec2295bd3bcb68703'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/git-wt/releases/download/v0.11.0/git-wt_v0.11.0_darwin_amd64.zip'
      sha256 'bf6a28fe68c908a03aee31b43d86aa2881a2c05008873a56957085a81772d1a8'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/git-wt/releases/download/v0.11.0/git-wt_v0.11.0_linux_arm64.tar.gz'
      sha256 'c1c29795850be32b93245408fa1eea6c6d02da69a75b4bd889662fb2576a96ba'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/git-wt/releases/download/v0.11.0/git-wt_v0.11.0_linux_amd64.tar.gz'
      sha256 '443a53425ac5bdfcf64e5be707a1f0bc2df5032ece5ca8ba7f7688d69f507ed3'
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
