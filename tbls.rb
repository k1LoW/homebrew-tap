class Tbls < Formula
  desc 'tbls is a CI-Friendly tool for document a database, written in Go.'
  version '1.91.1'
  homepage 'https://github.com/k1LoW/tbls'

  deprecate! date: "2025-08-02", because: "please use the official Homebrew formula instead"

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.91.1/tbls_v1.91.1_darwin_arm64.zip'
      sha256 '986c4c2b25ad573f3b685bc91fda0ae9e60ca7627ee536df8be09b6c5383d24e'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.91.1/tbls_v1.91.1_darwin_amd64.zip'
      sha256 '002019fbd39bc27772b487da44e05929982103958689cca4e373af8ad45e653d'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.91.1/tbls_v1.91.1_linux_arm64.tar.gz'
      sha256 '110bbdcd703d5375e2b4c0ce6d7f1127ed6045258ba73aa941e9a93cdf597e09'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.91.1/tbls_v1.91.1_linux_amd64.tar.gz'
      sha256 'e86b42b40c8b68d9e2563e3e22e37bb6009c014484dad6f7849fa7bd23916bfd'
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
