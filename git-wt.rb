class GitWt < Formula
  desc 'A Git subcommand that makes `git worktree` simple'
  version '0.1.0'
  homepage 'https://github.com/k1LoW/git-wt'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/git-wt/releases/download/v0.1.0/git-wt_v0.1.0_darwin_arm64.zip'
      sha256 '047bced60dab244a72c4e12999417ecb121d573fb594f683ec1772e2586a14ea'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/git-wt/releases/download/v0.1.0/git-wt_v0.1.0_darwin_amd64.zip'
      sha256 'b82c18614c3f2464fa69b035e370ce303ab4bd95a48686d2763663ef9c484bb5'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/git-wt/releases/download/v0.1.0/git-wt_v0.1.0_linux_arm64.tar.gz'
      sha256 'ec806a192ad1281e44c694cb67e7ca862202cfb759de2b1ee29ac48c12dc91e3'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/git-wt/releases/download/v0.1.0/git-wt_v0.1.0_linux_amd64.tar.gz'
      sha256 'a058f73fc7e0277dd8688447c167cdecbcaf3ec7d0cf8e8df09d51e029ea7041'
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
