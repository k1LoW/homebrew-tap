class Tbls < Formula
  desc 'tbls is a CI-Friendly tool for document a database, written in Go.'
  version '1.79.0'
  homepage 'https://github.com/k1LoW/tbls'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.79.0/tbls_v1.79.0_darwin_arm64.zip'
      sha256 '783301f1ad7e71673c94e600ab79c5bfd39189b506926a1ae68e6a70e13e43ad'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.79.0/tbls_v1.79.0_darwin_amd64.zip'
      sha256 '99457e4a680440f83acc307076b5d00a6cb2425a572c237cbedb904668e0c824'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.79.0/tbls_v1.79.0_linux_arm64.tar.gz'
      sha256 '927255b724400bf8fee51089483f83604f91e748cc8f5858f0e37e931640265c'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.79.0/tbls_v1.79.0_linux_amd64.tar.gz'
      sha256 'e49a33f45a3aa09a42382de8dc5e507ada16ef6915e0eaf4b78bf82a0bce5dcb'
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
