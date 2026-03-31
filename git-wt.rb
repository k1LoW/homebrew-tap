class GitWt < Formula
  desc 'A Git subcommand that makes `git worktree` simple'
  version '0.26.1'
  homepage 'https://github.com/k1LoW/git-wt'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/git-wt/releases/download/v0.26.1/git-wt_v0.26.1_darwin_arm64.zip'
      sha256 '3da403e12eb266ca2137b8dc6760594399e373234d92f3c0712ad137334a7c4e'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/git-wt/releases/download/v0.26.1/git-wt_v0.26.1_darwin_amd64.zip'
      sha256 '8892f2262fd71c8097bb4a3b437c3f4890c99a1a8e730ce6785f43fa430978b8'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/git-wt/releases/download/v0.26.1/git-wt_v0.26.1_linux_arm64.tar.gz'
      sha256 '93e9db1288e3ddffac3d8ccf3544bcc3ddacf1d1e249416075aefd59687ac137'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/git-wt/releases/download/v0.26.1/git-wt_v0.26.1_linux_amd64.tar.gz'
      sha256 '1c52480a138c25addd122ec5659bf89e2801ab7d17c82a994077f8d3865a371a'
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
