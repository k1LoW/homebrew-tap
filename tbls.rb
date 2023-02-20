class Tbls < Formula
  desc "tbls is a CI-Friendly tool for document a database, written in Go."
  version '1.62.1'
  homepage 'https://github.com/k1LoW/tbls'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.62.1/tbls_v1.62.1_darwin_arm64.zip'
      sha256 '94cf016bf186da23004bc00326244cafa66bf3a50b9325c3030d0a25fa42d052'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.62.1/tbls_v1.62.1_darwin_amd64.zip'
      sha256 '6affc3fc5286a594e46b86a2496ac5e5e79422e9dd1d745533d6396d08fdc4a8'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.62.1/tbls_v1.62.1_linux_amd64.tar.gz'
      sha256 '0d64c60e5408945a94fd2c900bad5bcfb9ed913c8ee423651a742a21fa792f87'
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
