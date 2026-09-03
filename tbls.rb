class Tbls < Formula
  desc 'tbls is a CI-Friendly tool for document a database, written in Go.'
  version '1.96.0'
  homepage 'https://github.com/k1LoW/tbls'

  deprecate! date: "2025-08-02", because: "please use the official Homebrew formula instead"

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.96.0/tbls_v1.96.0_darwin_arm64.zip'
      sha256 '9216c4404875703addde6f079bcb58316b5bf33a4630b0305ba8a7e460a00c02'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.96.0/tbls_v1.96.0_darwin_amd64.zip'
      sha256 '2028f2e4c8f23bbe7c704a8890c8e524ac1683254eb9beafcea7900107e11055'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.96.0/tbls_v1.96.0_linux_arm64.tar.gz'
      sha256 '600c332299a4265d11ef1c22d60638219985cbc2fadd6ba6aeaf2b808433e2ae'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.96.0/tbls_v1.96.0_linux_amd64.tar.gz'
      sha256 '246a070db940d0749ba9b46274d973d583feb0587b1b74afbd7772721e372371'
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
