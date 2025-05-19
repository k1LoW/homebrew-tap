class Tbls < Formula
  desc 'tbls is a CI-Friendly tool for document a database, written in Go.'
  version '1.85.4'
  homepage 'https://github.com/k1LoW/tbls'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.85.4/tbls_v1.85.4_darwin_arm64.zip'
      sha256 '832f01f4597388d5d73cd2030c3cab2f3f1aa9d0a9bf637b8f9f83da63ec7aac'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.85.4/tbls_v1.85.4_darwin_amd64.zip'
      sha256 '83fe555a70a9dcdfa2e91ce10bf525962a47e67190e0ec0a1b234eb3f54b7c03'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.85.4/tbls_v1.85.4_linux_arm64.tar.gz'
      sha256 '07ab444b9de6a8c3846fb7b3e793fd1f61b92afaf693825049b075a5f5e02cdd'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.85.4/tbls_v1.85.4_linux_amd64.tar.gz'
      sha256 'e7d5dcde70ebcfddee578c43db24b5bb2837c3e5fe3ba08e76990d052b2d1ac4'
    end
  end

  head do
    url 'https://github.com/k1LoW/tbls.git'
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    system './tbls', 'completion', 'bash', '--out', 'tbls.bash'
    system './tbls', 'completion', 'zsh', '--out', 'tbls.zsh'
    bin.install 'tbls'
    bash_completion.install 'tbls.bash' => 'tbls'
    zsh_completion.install 'tbls.zsh' => '_tbls'
  end
end
