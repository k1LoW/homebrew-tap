class Tbls < Formula
  desc 'tbls is a CI-Friendly tool for document a database, written in Go.'
  version '1.79.3'
  homepage 'https://github.com/k1LoW/tbls'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.79.3/tbls_v1.79.3_darwin_arm64.zip'
      sha256 'aeabfa76b4f8cc1a425dac4d55f389abc3bd2b5cf222454bb4e49e1b58125a6d'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.79.3/tbls_v1.79.3_darwin_amd64.zip'
      sha256 '7239f98a7663b90a4cee1923a0387bf5992bc6620a05ebe405550d4c66605c0a'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.79.3/tbls_v1.79.3_linux_arm64.tar.gz'
      sha256 '97206d1f100069abdd1d6f84ea7e5216433a279d60bc250f922e637f08eb1ee0'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.79.3/tbls_v1.79.3_linux_amd64.tar.gz'
      sha256 'cbfd8a9cf72b7dd60fc87b8009e7913490031433191964ad1e23eb04768de59a'
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
