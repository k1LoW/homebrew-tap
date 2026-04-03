class GitWt < Formula
  desc 'A Git subcommand that makes `git worktree` simple'
  version '0.26.2'
  homepage 'https://github.com/k1LoW/git-wt'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/git-wt/releases/download/v0.26.2/git-wt_v0.26.2_darwin_arm64.zip'
      sha256 'bed3cdc55c318c45c07e95a7b4ebd565c0cff7897330a8cb04610c028a282a77'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/git-wt/releases/download/v0.26.2/git-wt_v0.26.2_darwin_amd64.zip'
      sha256 '9ba82c5daac9538e8d36439d6669d6531d8687a99d474a5d4eb038d5c4b2f81f'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/git-wt/releases/download/v0.26.2/git-wt_v0.26.2_linux_arm64.tar.gz'
      sha256 '4451249aeee8f66c3190c4106f524c95736d40ca6a62009a50d50da9a7f9eb5a'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/git-wt/releases/download/v0.26.2/git-wt_v0.26.2_linux_amd64.tar.gz'
      sha256 '19ceb0365a4faf755868e87dd1382ffdfc2a4905402d47faf9fc91eca19e09c0'
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
