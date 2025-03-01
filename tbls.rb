class Tbls < Formula
  desc 'tbls is a CI-Friendly tool for document a database, written in Go.'
  version '1.82.0'
  homepage 'https://github.com/k1LoW/tbls'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.82.0/tbls_v1.82.0_darwin_arm64.zip'
      sha256 'b061da93dc36517eed2dd24ee1c1398b0151ed79832e896ceaf1cb73bcfee4d5'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.82.0/tbls_v1.82.0_darwin_amd64.zip'
      sha256 '19e3e05a298f5a824e08a81aa8749d3feb93235c5b99778d69d407079bbd5283'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.82.0/tbls_v1.82.0_linux_arm64.tar.gz'
      sha256 '0a2c5cce17ddc868db12da2eaf5c0e7f1e92ca8541623a917d536cca50381302'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.82.0/tbls_v1.82.0_linux_amd64.tar.gz'
      sha256 '9ba20f525416da530beb5d070bca2c1d1b7addc67f790c77a5992db324e33924'
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
