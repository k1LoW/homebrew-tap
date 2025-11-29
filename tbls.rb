class Tbls < Formula
  desc 'tbls is a CI-Friendly tool for document a database, written in Go.'
  version '1.91.4'
  homepage 'https://github.com/k1LoW/tbls'

  deprecate! date: "2025-08-02", because: "please use the official Homebrew formula instead"

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.91.4/tbls_v1.91.4_darwin_arm64.zip'
      sha256 'd38917ffa589d697cfee003fe9d8ba56376efa24285b0831bbb273e5023abf94'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.91.4/tbls_v1.91.4_darwin_amd64.zip'
      sha256 '24f5c8afc0331a629b908cdf06a9669b274d0c97dcbcc17b2f9cee5d8fec3713'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.91.4/tbls_v1.91.4_linux_arm64.tar.gz'
      sha256 'a0a948b622c445ccab46fe9e8e82427b402beddb224e10c89d65bfb47941570f'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.91.4/tbls_v1.91.4_linux_amd64.tar.gz'
      sha256 '85a034db4585e896ed2a633ba85022dd35ae176521423729cb91f968601ec431'
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
