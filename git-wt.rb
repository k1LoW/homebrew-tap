class GitWt < Formula
  desc 'A Git subcommand that makes `git worktree` simple'
  version '0.19.1'
  homepage 'https://github.com/k1LoW/git-wt'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/git-wt/releases/download/v0.19.1/git-wt_v0.19.1_darwin_arm64.zip'
      sha256 'e975b1d9033c634f537d65036b14361265e5bc039118bbed890c858ea6061e56'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/git-wt/releases/download/v0.19.1/git-wt_v0.19.1_darwin_amd64.zip'
      sha256 'ebc34bf68887e9cb7dacb9cae4489cf8d6519319c70e65e175443b491849cc7b'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/git-wt/releases/download/v0.19.1/git-wt_v0.19.1_linux_arm64.tar.gz'
      sha256 'aa5b52a92825184983e87cbbf3ed04880e0e054e15f35709d2781313cb318ecb'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/git-wt/releases/download/v0.19.1/git-wt_v0.19.1_linux_amd64.tar.gz'
      sha256 '931f215e43f6d5e951ee801e0a069920979feb9689c92d95f057b2638f09be1a'
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
