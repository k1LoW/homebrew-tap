class Tbls < Formula
  desc 'tbls is a CI-Friendly tool for document a database, written in Go.'
  version '1.80.0'
  homepage 'https://github.com/k1LoW/tbls'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.80.0/tbls_v1.80.0_darwin_arm64.zip'
      sha256 '325d149cd31f79366886bed3140b5e603e8140b76b9ecb7b98d55ee4e9d516c8'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.80.0/tbls_v1.80.0_darwin_amd64.zip'
      sha256 '5950b74cd7978ebae25944728f07ee8881d549fafbc999c01a116a35f51e7472'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.80.0/tbls_v1.80.0_linux_arm64.tar.gz'
      sha256 '8680367e31ba6ed139d8948de38a9489b5d7d031ea1e1824675646ed8d9b8a4e'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.80.0/tbls_v1.80.0_linux_amd64.tar.gz'
      sha256 'f12b9329688f59c68d163909edae04407784540872c2cf3f5624a4a06ce073a0'
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
