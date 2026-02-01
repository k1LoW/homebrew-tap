class GitWt < Formula
  desc 'A Git subcommand that makes `git worktree` simple'
  version '0.17.0'
  homepage 'https://github.com/k1LoW/git-wt'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/git-wt/releases/download/v0.17.0/git-wt_v0.17.0_darwin_arm64.zip'
      sha256 'e69e8a893a4e7e0da328163666db4f9546f258a6cab353bef7a932efe1fda8a0'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/git-wt/releases/download/v0.17.0/git-wt_v0.17.0_darwin_amd64.zip'
      sha256 '54608faa973b915a7f896da89c55afc4b27843a8623065fbc1b9ffcddd3c5438'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/git-wt/releases/download/v0.17.0/git-wt_v0.17.0_linux_arm64.tar.gz'
      sha256 '37eee880929bd356f88d134c394ccc2a748882389ff81ec94b002d3c443fad4d'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/git-wt/releases/download/v0.17.0/git-wt_v0.17.0_linux_amd64.tar.gz'
      sha256 'dc56818ddb1bd13f9ddfb7f59a2e5a3b1244cf4d0bf9ffc1ddec6338c38a4685'
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
