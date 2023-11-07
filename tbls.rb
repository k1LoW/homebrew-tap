class Tbls < Formula
  desc 'tbls is a CI-Friendly tool for document a database, written in Go.'
  version '1.71.1'
  homepage 'https://github.com/k1LoW/tbls'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.71.1/tbls_v1.71.1_darwin_arm64.zip'
      sha256 '2e4e3f903c3c78f9a1e91498d3dc276219670759181da48c88077b11d9c6e47d'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.71.1/tbls_v1.71.1_darwin_amd64.zip'
      sha256 '597104ae10a263191ad5a7f3d26035a3bc7c63927f432eb213277b93a3a3338c'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.71.1/tbls_v1.71.1_linux_arm64.tar.gz'
      sha256 '92781db42dadca645b79b537899a066a30ab476acfce30fed5b94a2c0f24591b'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.71.1/tbls_v1.71.1_linux_amd64.tar.gz'
      sha256 '5455f20de2735c4ebe637ed03055b347efee6e42abf964a2f3cedbdd484ec1ba'
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
