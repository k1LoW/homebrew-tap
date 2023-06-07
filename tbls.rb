class Tbls < Formula
  desc "tbls is a CI-Friendly tool for document a database, written in Go."
  version '1.65.4'
  homepage 'https://github.com/k1LoW/tbls'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.65.4/tbls_v1.65.4_darwin_arm64.zip'
      sha256 'fe2422e80174f4a635b9437faa8f96e7560e6e777e2c5a164627f42b73e7f9ae'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.65.4/tbls_v1.65.4_darwin_amd64.zip'
      sha256 '3583af7bfee2f5c6c0065cd8634f9d1910baafca10a38e33c3c4728177cb4316'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.65.4/tbls_v1.65.4_linux_amd64.tar.gz'
      sha256 '419e19f1972df49676954a675d2bb3b31e68e011790301cbabcf6d4859733c04'
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
