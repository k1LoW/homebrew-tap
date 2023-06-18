class Tbls < Formula
  desc "tbls is a CI-Friendly tool for document a database, written in Go."
  version '1.67.1'
  homepage 'https://github.com/k1LoW/tbls'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.67.1/tbls_v1.67.1_darwin_arm64.zip'
      sha256 'fada86a7d4468698903b0ae93f0bd97c5bf36c93cf694af330fb2e315bb39296'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.67.1/tbls_v1.67.1_darwin_amd64.zip'
      sha256 '2f09148ec68a3eb5d890f135979051c163b9d602e90a2b38a004f13a28bc8704'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.67.1/tbls_v1.67.1_linux_amd64.tar.gz'
      sha256 '8fd2fffa04f053b364f5181984bdf2dd7156eee232af2be24873a3d96a0a97d5'
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
