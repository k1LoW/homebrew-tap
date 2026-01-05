class GitWt < Formula
  desc 'A Git subcommand that makes `git worktree` simple'
  version '0.8.0'
  homepage 'https://github.com/k1LoW/git-wt'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/git-wt/releases/download/v0.8.0/git-wt_v0.8.0_darwin_arm64.zip'
      sha256 '57402924b54fdc79bb3f99fee721a1ca8443fe90474842a698452570f40b601a'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/git-wt/releases/download/v0.8.0/git-wt_v0.8.0_darwin_amd64.zip'
      sha256 'bd96c9dd6d056b4825d9e93ccbc94d1923185c607e9ed4c775196b6b04882794'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/git-wt/releases/download/v0.8.0/git-wt_v0.8.0_linux_arm64.tar.gz'
      sha256 'd6fffe394ff519242445ed20d94170d3ed46f5561c75ad168237dc7dd1fd6e84'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/git-wt/releases/download/v0.8.0/git-wt_v0.8.0_linux_amd64.tar.gz'
      sha256 '95c7fb5e1c965ee824d2ec4e5f6164aa62091dea134a1d5f3917cea63dd82bcd'
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
