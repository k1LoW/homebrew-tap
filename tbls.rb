class Tbls < Formula
  desc "tbls is a CI-Friendly tool for document a database, written in Go."
  version '1.68.0'
  homepage 'https://github.com/k1LoW/tbls'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.68.0/tbls_v1.68.0_darwin_arm64.zip'
      sha256 '2f5dfd4bb5bb803eb0ad99cd785ceffaff4a65668eff13f5de2da4a95d927da9'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.68.0/tbls_v1.68.0_darwin_amd64.zip'
      sha256 '8f3d08f968389e9390b395fd641547d299f988e0f623dfde84c81da54033777a'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.68.0/tbls_v1.68.0_linux_amd64.tar.gz'
      sha256 '365b7eef90b54850913eb096442d29c5c5c1b805697e117ab2da59dc7971491d'
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
