class Tbls < Formula
  desc 'tbls is a CI-Friendly tool for document a database, written in Go.'
  version '1.83.0'
  homepage 'https://github.com/k1LoW/tbls'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.83.0/tbls_v1.83.0_darwin_arm64.zip'
      sha256 '6446771f742f7ca9830cb0fbdfbe5d81db24567db2e91ee6c7f190459c6e05c8'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.83.0/tbls_v1.83.0_darwin_amd64.zip'
      sha256 '77e488f8015e06ee1d745d0991d9eaa99d89d406c844a9a8f1f9a3dbf8ac8211'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.83.0/tbls_v1.83.0_linux_arm64.tar.gz'
      sha256 'f4441abd1875a5b3d556708fddbc1badd9149691ad8f876d662868f63699fe64'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.83.0/tbls_v1.83.0_linux_amd64.tar.gz'
      sha256 '6a41607d79a8fd59154d861d9d623055d8ffe51f262675a8525272c2e639b9fb'
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
