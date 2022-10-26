class Tbls < Formula
  desc "tbls is a CI-Friendly tool for document a database, written in Go."
  version '1.56.5'
  homepage 'https://github.com/k1LoW/tbls'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.56.5/tbls_v1.56.5_darwin_arm64.zip'
      sha256 'ded2ec0a4fb4ee9e0bb1103e298c18e7b95db5710ef377021bd07602253878c5'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.56.5/tbls_v1.56.5_darwin_amd64.zip'
      sha256 '3496975cc6a3d072fe3fadc0dadf87cc8a5717da41abfe2fc62bddf488dacd4a'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.56.5/tbls_v1.56.5_linux_amd64.tar.gz'
      sha256 '2b8dd44eae81e518c5d0a032999d62562ece59bb501bd4439ea4eae27ce322be'
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
