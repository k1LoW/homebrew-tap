class GitWt < Formula
  desc 'A Git subcommand that makes `git worktree` simple'
  version '0.29.3'
  homepage 'https://github.com/k1LoW/git-wt'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/git-wt/releases/download/v0.29.3/git-wt_v0.29.3_darwin_arm64.zip'
      sha256 '51381cc5651e186e92d215549380ca3a626b6dd57b54e5283b47aa854a031dcb'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/git-wt/releases/download/v0.29.3/git-wt_v0.29.3_darwin_amd64.zip'
      sha256 'c13cd2108a30e77d3fc1e0e328457b8f7bdf340c1e569374d80c324bbb311cdb'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/git-wt/releases/download/v0.29.3/git-wt_v0.29.3_linux_arm64.tar.gz'
      sha256 'd8e3574eae3c06c84472d1133951f7f41d460a8fd9fd93efd3d6d867fed5a59d'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/git-wt/releases/download/v0.29.3/git-wt_v0.29.3_linux_amd64.tar.gz'
      sha256 '8fc67b34e92bf61fd509ee777df8d8d53442aa3c0d908e7fccffb972aad5a9eb'
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
