class Tbls < Formula
  desc 'tbls is a CI-Friendly tool for document a database, written in Go.'
  version '1.88.0'
  homepage 'https://github.com/k1LoW/tbls'

  deprecate! date: "2025-08-02", because: "please use the official Homebrew formula instead"

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.88.0/tbls_v1.88.0_darwin_arm64.zip'
      sha256 '003b6d2422df515891d5861099f3d71d3ba2507a110888af421a26fe08f8433a'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.88.0/tbls_v1.88.0_darwin_amd64.zip'
      sha256 'c45880c5680c5f1af897c069b8c6fbf92c54ddc9233f0a321b2cb8b245f260ba'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.88.0/tbls_v1.88.0_linux_arm64.tar.gz'
      sha256 '916cdf7ab4b6d1f235f98c9e73811f926219af5c95767292ac5b33b73d3f1e1b'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.88.0/tbls_v1.88.0_linux_amd64.tar.gz'
      sha256 '29b085cfc15369a423a53b5cde5811273333c29be9185c2a9188b7b523761161'
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
