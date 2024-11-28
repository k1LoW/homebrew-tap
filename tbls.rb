class Tbls < Formula
  desc 'tbls is a CI-Friendly tool for document a database, written in Go.'
  version '1.79.4'
  homepage 'https://github.com/k1LoW/tbls'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.79.4/tbls_v1.79.4_darwin_arm64.zip'
      sha256 '83bccba54e0ad987e1f1edd8ea826b1a24317babb1c202c949d9cc923c206001'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.79.4/tbls_v1.79.4_darwin_amd64.zip'
      sha256 '3ec2ccc253ef8528867a498ef92ef366e05ed78510c0542220d5534c9e22a7af'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.79.4/tbls_v1.79.4_linux_arm64.tar.gz'
      sha256 '5634298b5dd316876ab3b78846a550bc6693768c3bbfb5441aceaa9e2433a30f'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.79.4/tbls_v1.79.4_linux_amd64.tar.gz'
      sha256 'f0d9e0fb503fc9029405380727b6886796c3dec18c26ae24b94bb65d7933be1d'
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
