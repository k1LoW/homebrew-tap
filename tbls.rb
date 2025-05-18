class Tbls < Formula
  desc 'tbls is a CI-Friendly tool for document a database, written in Go.'
  version '1.85.3'
  homepage 'https://github.com/k1LoW/tbls'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.85.3/tbls_v1.85.3_darwin_arm64.zip'
      sha256 'cf2912b4fc0fdc8a5d907c2813495c15daac6f67e8799af15a4cc344e8e328ff'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.85.3/tbls_v1.85.3_darwin_amd64.zip'
      sha256 '1d5541deaab7dd02a2b2bfa0a54e06f2a07d0ba830adef759eaaf7430da245dd'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.85.3/tbls_v1.85.3_linux_arm64.tar.gz'
      sha256 'b433c1cdadab45ca8d75ad5c0e1589262ceba98045a7f06e6f4ccadfc7108f09'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.85.3/tbls_v1.85.3_linux_amd64.tar.gz'
      sha256 'dea8c902b73fd42c2d9c53b04569e13584c82a486c17778a1e4e746f86574e2d'
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
