class Tbls < Formula
  desc 'tbls is a CI-Friendly tool for document a database, written in Go.'
  version '1.94.0'
  homepage 'https://github.com/k1LoW/tbls'

  deprecate! date: "2025-08-02", because: "please use the official Homebrew formula instead"

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.94.0/tbls_v1.94.0_darwin_arm64.zip'
      sha256 'ebadc0d3f4591b91c356e026e9b0f5ba1236ec890ee969395e5d8bea9492ce2f'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.94.0/tbls_v1.94.0_darwin_amd64.zip'
      sha256 '35575a566605f6ce86cb968a789b80a7aac1e550784d4a5624933319ce18fa72'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.94.0/tbls_v1.94.0_linux_arm64.tar.gz'
      sha256 'df9ab998fd456da760eab6c9793b8725bee1336b045da1891d79359c56191173'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.94.0/tbls_v1.94.0_linux_amd64.tar.gz'
      sha256 '2fb0f3bc3188359c2472a98fade9236911fbf179cf388069270f49efbafa27a3'
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
