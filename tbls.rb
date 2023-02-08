class Tbls < Formula
  desc "tbls is a CI-Friendly tool for document a database, written in Go."
  version '1.62.0'
  homepage 'https://github.com/k1LoW/tbls'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.62.0/tbls_v1.62.0_darwin_arm64.zip'
      sha256 'bed2549010a392e96084efae6bcf340783fcb536d4a0bb52672bf629847d8251'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.62.0/tbls_v1.62.0_darwin_amd64.zip'
      sha256 'bf0223496506c7730774f836428f8eda41ce24205de41a058dac185b4d35ea16'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.62.0/tbls_v1.62.0_linux_amd64.tar.gz'
      sha256 '402c88aa7b7e51ca620a9b51b8625cf01a42ae2f4d11d0b623721f51e53fee78'
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
