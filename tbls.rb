class Tbls < Formula
  desc 'tbls is a CI-Friendly tool for document a database, written in Go.'
  version '1.94.1'
  homepage 'https://github.com/k1LoW/tbls'

  deprecate! date: "2025-08-02", because: "please use the official Homebrew formula instead"

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.94.1/tbls_v1.94.1_darwin_arm64.zip'
      sha256 '69c7d0d414ffc8c6cccc01044c34568dab05176140ab24fa69faec5c74a738b6'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.94.1/tbls_v1.94.1_darwin_amd64.zip'
      sha256 'c281c89d874ee4961e15ffdccc4b3aded602314d112b213f347cb42e3db859c6'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.94.1/tbls_v1.94.1_linux_arm64.tar.gz'
      sha256 '9d1b4bc6b098f0ea8ef533415736ffeb8caa2ea6cd6642fb86ebf4c7dc9c4b25'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.94.1/tbls_v1.94.1_linux_amd64.tar.gz'
      sha256 '14c6778d03c6e6dcca9c1838e9c76ae941af49a2d763a3c67a1279ecac5f7a4b'
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
