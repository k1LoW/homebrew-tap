class Tbls < Formula
  desc 'tbls is a CI-Friendly tool for document a database, written in Go.'
  version '1.94.5'
  homepage 'https://github.com/k1LoW/tbls'

  deprecate! date: "2025-08-02", because: "please use the official Homebrew formula instead"

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.94.5/tbls_v1.94.5_darwin_arm64.zip'
      sha256 'da1d17f3174c9aa6ca78925f9af27588ad5c733dbddf8ff539533ab2946b3693'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.94.5/tbls_v1.94.5_darwin_amd64.zip'
      sha256 'c090035eacd3452f57510c616884ed3e9e8fb2e3e5fcf883c65101a388d730ec'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.94.5/tbls_v1.94.5_linux_arm64.tar.gz'
      sha256 'cf8e47fe2b5bde9b6ec919ead72667b1774a94ac3cff75f37c96d045aad50098'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.94.5/tbls_v1.94.5_linux_amd64.tar.gz'
      sha256 '0ee4381c65fb222c64f0dba039dc956a20097167500e2cf96fd7264249b94f79'
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
