class GitWt < Formula
  desc 'A Git subcommand that makes `git worktree` simple'
  version '0.3.0'
  homepage 'https://github.com/k1LoW/git-wt'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/git-wt/releases/download/v0.3.0/git-wt_v0.3.0_darwin_arm64.zip'
      sha256 '8bccc019ff69c1810cf3d21a714aad273977d8f33848a070aff9a8bc00f18e15'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/git-wt/releases/download/v0.3.0/git-wt_v0.3.0_darwin_amd64.zip'
      sha256 '3d4072dd37829bec161cf91a8f830b6de9aee832c9346436d866c54d3b578955'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/git-wt/releases/download/v0.3.0/git-wt_v0.3.0_linux_arm64.tar.gz'
      sha256 'e77472552ffef88cb4485c9cf62f3adb4c0493c0a8ee070c4d0dee138f5a6889'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/git-wt/releases/download/v0.3.0/git-wt_v0.3.0_linux_amd64.tar.gz'
      sha256 'f577138a4836dae57b7196ff081ae8d2405ab95563fcf2f58cfee28a0f1d72fa'
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
