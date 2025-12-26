class GitWt < Formula
  desc 'A Git subcommand that makes `git worktree` simple'
  version '0.2.2'
  homepage 'https://github.com/k1LoW/git-wt'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/git-wt/releases/download/v0.2.2/git-wt_v0.2.2_darwin_arm64.zip'
      sha256 '798cd50d5d1292cf0341240b3d6bae78e44221d05dbaff11631404ccc1b20c32'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/git-wt/releases/download/v0.2.2/git-wt_v0.2.2_darwin_amd64.zip'
      sha256 'd9581622a06ded2a722ec97e1f139843e52fdc54cc4d5d25afe119813383dfa3'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/git-wt/releases/download/v0.2.2/git-wt_v0.2.2_linux_arm64.tar.gz'
      sha256 '0194673c7ff1d758affa287c888f9fad1f87eb29999e7adb440b9d8a7e3000ef'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/git-wt/releases/download/v0.2.2/git-wt_v0.2.2_linux_amd64.tar.gz'
      sha256 'd2932e68b08f5e1ec4cee8139f30ce1266f90e52f7722718404ced1205c11e01'
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
