class GitWt < Formula
  desc 'A Git subcommand that makes `git worktree` simple'
  version '0.2.1'
  homepage 'https://github.com/k1LoW/git-wt'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/git-wt/releases/download/v0.2.1/git-wt_v0.2.1_darwin_arm64.zip'
      sha256 '064452421f79545ddf3cecb9977bf1b239bb5116224cc44acb80f143a66a7c7c'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/git-wt/releases/download/v0.2.1/git-wt_v0.2.1_darwin_amd64.zip'
      sha256 '2070efb7d58d2e186a9191e437074650f806375c46f34611bc884e962cb759f2'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/git-wt/releases/download/v0.2.1/git-wt_v0.2.1_linux_arm64.tar.gz'
      sha256 '53bf7de358708a28bd67582c70ca0dac6859070a147fe5ca17983dc0edcbecda'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/git-wt/releases/download/v0.2.1/git-wt_v0.2.1_linux_amd64.tar.gz'
      sha256 'adf5b6103aacb7c74d64d2ad145391df7e73757ff054f800001f096eec0b6be7'
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
