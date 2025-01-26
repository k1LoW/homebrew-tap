class Tbls < Formula
  desc 'tbls is a CI-Friendly tool for document a database, written in Go.'
  version '1.81.0'
  homepage 'https://github.com/k1LoW/tbls'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.81.0/tbls_v1.81.0_darwin_arm64.zip'
      sha256 '25346f8ad7750d18368d7f72a0b86ffc72d7be30236f426dca71ea80a0d31754'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.81.0/tbls_v1.81.0_darwin_amd64.zip'
      sha256 'abece41d7017467387f9a6cc94139d307aef7f2bd6ad5e298aaf1eb7f020e1ef'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.81.0/tbls_v1.81.0_linux_arm64.tar.gz'
      sha256 'fec4285f1e72781b3566548ef63fd40ff67a4ca2ea456b62e76f7526842d7a98'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.81.0/tbls_v1.81.0_linux_amd64.tar.gz'
      sha256 '55374bf062ff131b8a4d4e102650f4d09e64ee59bd9123469c168806d5ea5986'
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
