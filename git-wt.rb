class GitWt < Formula
  desc 'A Git subcommand that makes `git worktree` simple'
  version '0.22.0'
  homepage 'https://github.com/k1LoW/git-wt'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/git-wt/releases/download/v0.22.0/git-wt_v0.22.0_darwin_arm64.zip'
      sha256 '560333af08cd6ba503fd19a4b79f306c9e0805fa46eebead7470c222538de526'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/git-wt/releases/download/v0.22.0/git-wt_v0.22.0_darwin_amd64.zip'
      sha256 '8783131a0173c16b5da3e09ec15a2306c2e3f586ad87248f2431e4c694dfcbbc'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/git-wt/releases/download/v0.22.0/git-wt_v0.22.0_linux_arm64.tar.gz'
      sha256 '2d823dd32844860df8928211e6b80317063c5d34fb6e8777792d5a710c3e4257'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/git-wt/releases/download/v0.22.0/git-wt_v0.22.0_linux_amd64.tar.gz'
      sha256 'c94e4f11cd60782de6e5c651ec3f81f9701ec1ca127741211b7346239f5bbfcd'
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
