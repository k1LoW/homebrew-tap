class Tbls < Formula
  desc 'tbls is a CI-Friendly tool for document a database, written in Go.'
  version '1.89.1'
  homepage 'https://github.com/k1LoW/tbls'

  deprecate! date: "2025-08-02", because: "please use the official Homebrew formula instead"

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.89.1/tbls_v1.89.1_darwin_arm64.zip'
      sha256 '259f751b5e572a36e62704bf67d7451c9241f97263a20645a1bec62970d2b746'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.89.1/tbls_v1.89.1_darwin_amd64.zip'
      sha256 '0a78c1eecc61ad020cfc96f59393b647f29612d05fe0262e037114c4b644af8e'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.89.1/tbls_v1.89.1_linux_arm64.tar.gz'
      sha256 'ebf7a1687a66965dea731bf542160fecabfe3c78b2334ea553e465e8935853e6'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.89.1/tbls_v1.89.1_linux_amd64.tar.gz'
      sha256 '0ecb13b7c7eac18f49976045ea326e19eab5d03da1e479446603493eab3c737b'
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
