class Tbls < Formula
  desc 'tbls is a CI-Friendly tool for document a database, written in Go.'
  version '1.70.0'
  homepage 'https://github.com/k1LoW/tbls'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.70.0/tbls_v1.70.0_darwin_arm64.zip'
      sha256 'bd95e196bd02467887a4f7eea2b6659d1045464f8a5921db3e42c78dd9027dd2'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.70.0/tbls_v1.70.0_darwin_amd64.zip'
      sha256 'fe8a69baa80424e9b0d09a1d00f9bb83440ab4b9770cd480a721a1eefea69d70'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.70.0/tbls_v1.70.0_linux_arm64.tar.gz'
      sha256 '48ad47b7a9b4809729759fd4b0dba733ca484c0b5260a87cd4992d192aadcc8e'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.70.0/tbls_v1.70.0_linux_amd64.tar.gz'
      sha256 '996bf0ee48553a396b03047048ff58d79bf88f66c8ba1077fe2af5f48f6c153e'
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
