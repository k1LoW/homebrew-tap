class Tbls < Formula
  desc 'tbls is a CI-Friendly tool for document a database, written in Go.'
  version '1.73.3'
  homepage 'https://github.com/k1LoW/tbls'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.73.3/tbls_v1.73.3_darwin_arm64.zip'
      sha256 '563635e995c2a3a92645d8c3dda668bed1f110d40f490279cbaa2ab238a6c4c9'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.73.3/tbls_v1.73.3_darwin_amd64.zip'
      sha256 'ec66da0171189f443dc21165e9622a8a1cb6bf64c85e35ef74f7c741cef05a85'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.73.3/tbls_v1.73.3_linux_arm64.tar.gz'
      sha256 '2ecd893114f217942f855f37eb32703a6bdc5aef2840d556e8b8552df88ad2ad'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.73.3/tbls_v1.73.3_linux_amd64.tar.gz'
      sha256 '271de9e17f528e2cd2ed61a71e49c9c1b30d578c866cf8d0b18045abab9f516a'
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
