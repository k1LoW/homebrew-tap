class Tbls < Formula
  desc "tbls is a CI-Friendly tool for document a database, written in Go."
  version '1.60.0'
  homepage 'https://github.com/k1LoW/tbls'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.60.0/tbls_v1.60.0_darwin_arm64.zip'
      sha256 'c545dc8252355bcb8933e5d874e9cba7e7525e7c8f95f31e3bfc078e41345758'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.60.0/tbls_v1.60.0_darwin_amd64.zip'
      sha256 '25e9ac266763ae4da1466f8c7ed96395a2b8f90634a106fff17ca7c1c9ee40e8'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.60.0/tbls_v1.60.0_linux_amd64.tar.gz'
      sha256 'f1ee97bbf22d5324ec2b468d83f43088d9e5c61deb77fafc220b297e03d47574'
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
