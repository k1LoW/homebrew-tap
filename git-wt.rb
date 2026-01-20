class GitWt < Formula
  desc 'A Git subcommand that makes `git worktree` simple'
  version '0.14.0'
  homepage 'https://github.com/k1LoW/git-wt'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/git-wt/releases/download/v0.14.0/git-wt_v0.14.0_darwin_arm64.zip'
      sha256 '813cd745796389ffe4590639692c13e161f7ae490807915bb5dfec2708154a95'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/git-wt/releases/download/v0.14.0/git-wt_v0.14.0_darwin_amd64.zip'
      sha256 '8db1cb96bc240c1b70468dc3f77013fbc294f4c6f6cb1f94c8800fa75a039d94'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/git-wt/releases/download/v0.14.0/git-wt_v0.14.0_linux_arm64.tar.gz'
      sha256 'a3674cd0f329ae4e3fc2279036ea5a0e333bf5840f4e27768d6a942835994a8a'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/git-wt/releases/download/v0.14.0/git-wt_v0.14.0_linux_amd64.tar.gz'
      sha256 '7e93121a18426ce30ca4d4e66c0cbac054f3d91550ffc9fd79e73d6b895d1b3e'
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
