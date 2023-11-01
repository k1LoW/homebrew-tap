class Tbls < Formula
  desc 'tbls is a CI-Friendly tool for document a database, written in Go.'
  version '1.71.0'
  homepage 'https://github.com/k1LoW/tbls'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.71.0/tbls_v1.71.0_darwin_arm64.zip'
      sha256 '4a595a7af9d20cdca461f5d194aa3b56a86a78d79c338b8210a59ed84426abd1'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.71.0/tbls_v1.71.0_darwin_amd64.zip'
      sha256 '50b7ffb509c7fabd9640920aaaef3d19e5cf5b0c2de6ed309f4e76aa5c6993b4'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.71.0/tbls_v1.71.0_linux_arm64.tar.gz'
      sha256 '000a200c6ee04801c6418dc573dcf14e0a6c1f0747a8a5ba220427fe362f2944'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.71.0/tbls_v1.71.0_linux_amd64.tar.gz'
      sha256 '823445abcde0161596b1bf945091ce16aa75e6c27cf4c7299d634528b6dfb662'
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
