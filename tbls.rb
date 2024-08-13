class Tbls < Formula
  desc 'tbls is a CI-Friendly tool for document a database, written in Go.'
  version '1.77.0'
  homepage 'https://github.com/k1LoW/tbls'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.77.0/tbls_v1.77.0_darwin_arm64.zip'
      sha256 'b4301e9fbdf207eb1133e95b9a40566ce39c22c85d4f129e1af31dd0a734165c'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.77.0/tbls_v1.77.0_darwin_amd64.zip'
      sha256 'de1d6258c107d8241cda2ed9de8a021f2ccf33f26673666a9f34ed2f6b9524c6'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.77.0/tbls_v1.77.0_linux_arm64.tar.gz'
      sha256 '2807415871fae88a78f9b5547a02e9508a6be159ef5e184d66052d1fee17639d'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.77.0/tbls_v1.77.0_linux_amd64.tar.gz'
      sha256 '3f7da51d1ddf528366cc7b2028f278caa41523185e7195b300ed9d061f054dcd'
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
