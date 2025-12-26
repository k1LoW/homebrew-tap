class GitWt < Formula
  desc 'A Git subcommand that makes `git worktree` simple'
  version '0.2.3'
  homepage 'https://github.com/k1LoW/git-wt'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/git-wt/releases/download/v0.2.3/git-wt_v0.2.3_darwin_arm64.zip'
      sha256 'de80a5c18c6d407fc6c6f2e382c822c476d7b0aba0899ed5eb3ba347b24908ec'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/git-wt/releases/download/v0.2.3/git-wt_v0.2.3_darwin_amd64.zip'
      sha256 '5579ab46d2e9730d4233d65f42378b6cda7bbc1ab2e3e48bbd870afcced84f05'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/git-wt/releases/download/v0.2.3/git-wt_v0.2.3_linux_arm64.tar.gz'
      sha256 'ea345145acf69349a24c57df5ec18f30e3166ca562fc18ab735da0c3bba32ae0'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/git-wt/releases/download/v0.2.3/git-wt_v0.2.3_linux_amd64.tar.gz'
      sha256 'd938c3609f97e7dc891a294a7c2949b5f9a126df414c8d354fa2e3011150f79c'
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
