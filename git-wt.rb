class GitWt < Formula
  desc 'A Git subcommand that makes `git worktree` simple'
  version '0.15.1'
  homepage 'https://github.com/k1LoW/git-wt'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/git-wt/releases/download/v0.15.1/git-wt_v0.15.1_darwin_arm64.zip'
      sha256 'd0dd5af5f8c5314065b1ba00bba652734b99668c8e662aa7ba8ae1464bfecd79'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/git-wt/releases/download/v0.15.1/git-wt_v0.15.1_darwin_amd64.zip'
      sha256 '9079cf937191173d3131eab19f69b9514a2403278d33e0e524f40ce79d90591b'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/git-wt/releases/download/v0.15.1/git-wt_v0.15.1_linux_arm64.tar.gz'
      sha256 'dded48a826ca311194bd92bd58a0ea9adec281b347105c56cc317d5a267d555b'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/git-wt/releases/download/v0.15.1/git-wt_v0.15.1_linux_amd64.tar.gz'
      sha256 '18ac6f62a69f2a5bb59a037074cfa0cdfa1924f2098890af2add64b0f6c2b76b'
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
