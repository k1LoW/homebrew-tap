class Tbls < Formula
  desc "tbls is a CI-Friendly tool for document a database, written in Go."
  version '1.68.2'
  homepage 'https://github.com/k1LoW/tbls'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.68.2/tbls_v1.68.2_darwin_arm64.zip'
      sha256 '5310aaf2ac064a684b377c31ed991b0e242c4d59e8a5f321c2303742a03aacb3'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.68.2/tbls_v1.68.2_darwin_amd64.zip'
      sha256 '2378043d713bf6bb9a0742f9a9e5f781316f674caac89e97dbcc201d522dd158'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.68.2/tbls_v1.68.2_linux_amd64.tar.gz'
      sha256 '06f812927e1cb6189ac5c80b6eedb16497845f1d952a1476451b81d7ee49b445'
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
