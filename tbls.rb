class Tbls < Formula
  desc 'tbls is a CI-Friendly tool for document a database, written in Go.'
  version '1.74.3'
  homepage 'https://github.com/k1LoW/tbls'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.74.3/tbls_v1.74.3_darwin_arm64.zip'
      sha256 '18c562f100e2c43d23f3609bdd4c4e59f23a516f5241e6a01ee286c50c7a4cbc'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.74.3/tbls_v1.74.3_darwin_amd64.zip'
      sha256 '378f1454a08adb63499e2abf66788aa71b05481d0cb4b33d47a1e4798dc56b1f'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.74.3/tbls_v1.74.3_linux_arm64.tar.gz'
      sha256 '63f5bfdb77e65b89f035201a170d47aa4260bf27578349acd4778310c9ae72ef'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.74.3/tbls_v1.74.3_linux_amd64.tar.gz'
      sha256 '7d71cc55dc1b20083e144c1c20a5e3bd34ccefb5b469a671671c8101965b28e7'
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
