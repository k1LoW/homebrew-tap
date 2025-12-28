class GitWt < Formula
  desc 'A Git subcommand that makes `git worktree` simple'
  version '0.5.0'
  homepage 'https://github.com/k1LoW/git-wt'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/git-wt/releases/download/v0.5.0/git-wt_v0.5.0_darwin_arm64.zip'
      sha256 'e6ec466b0a1217d6fbb492b3afcb7c160e4f5c5296bded73f8a0a3095e9701d3'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/git-wt/releases/download/v0.5.0/git-wt_v0.5.0_darwin_amd64.zip'
      sha256 'b17263d6a419c3736a57c73ae7db795fd37a5d07a0ac7cb7beb3cdff3febbf76'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/git-wt/releases/download/v0.5.0/git-wt_v0.5.0_linux_arm64.tar.gz'
      sha256 '7b64543c09cbdb3c080a4d2089762c2ec23a1ed2d7d22562aa8ddbd0b413eab9'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/git-wt/releases/download/v0.5.0/git-wt_v0.5.0_linux_amd64.tar.gz'
      sha256 '2ec9fb0389a0d822c995e0ef9376bfa607c24d603cac719559573160fbfcd5a5'
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
