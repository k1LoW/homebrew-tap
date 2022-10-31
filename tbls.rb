class Tbls < Formula
  desc "tbls is a CI-Friendly tool for document a database, written in Go."
  version '1.56.6'
  homepage 'https://github.com/k1LoW/tbls'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.56.6/tbls_v1.56.6_darwin_arm64.zip'
      sha256 '0776bbb7dc56eee7fdba7cafe39223ad47f0980628a24fbcd9876a2c8457274e'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.56.6/tbls_v1.56.6_darwin_amd64.zip'
      sha256 '2e90ca293fdb5d0c4e0efad97783b926d15588b0ed38020d162e6b86fc52364a'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.56.6/tbls_v1.56.6_linux_amd64.tar.gz'
      sha256 '4d9850d9052f6879fc0133189dc477960e000d25b28374c3a27eafa1971c7964'
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
