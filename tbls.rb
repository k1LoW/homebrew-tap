class Tbls < Formula
  desc "tbls is a CI-Friendly tool for document a database, written in Go."
  version '1.56.8'
  homepage 'https://github.com/k1LoW/tbls'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.56.8/tbls_v1.56.8_darwin_arm64.zip'
      sha256 '6aaafd6a5fdc56b3a10e13bb87d89562f2ebb41e608135f5f40778c9e9734c07'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.56.8/tbls_v1.56.8_darwin_amd64.zip'
      sha256 '7421dc60600a92b0f05379008cb22b3a1b551d6c11659072b3f654a13175eb3b'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.56.8/tbls_v1.56.8_linux_amd64.tar.gz'
      sha256 '2281ef7bdc64a8010765aa619bc61b2dca24a57380bdbee66afb2a319920ae08'
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
