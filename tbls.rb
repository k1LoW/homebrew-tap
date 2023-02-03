class Tbls < Formula
  desc "tbls is a CI-Friendly tool for document a database, written in Go."
  version '1.61.0'
  homepage 'https://github.com/k1LoW/tbls'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.61.0/tbls_v1.61.0_darwin_arm64.zip'
      sha256 '3497561c19c216995a43885673ec27e4bb10dd5efb0a735e0327a93f51f3f5b1'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.61.0/tbls_v1.61.0_darwin_amd64.zip'
      sha256 '40332cabfba3dc92dc94e2bbcf2c6261f41ba041a4565bd71a012b1ed9575dbc'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.61.0/tbls_v1.61.0_linux_amd64.tar.gz'
      sha256 'c955c3c8a569912d33523c3c24bfefb850e5e5be9b8b9adfbcf57cc5ccba3d1f'
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
