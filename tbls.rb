class Tbls < Formula
  desc "tbls is a CI-Friendly tool for document a database, written in Go."
  version '1.68.1'
  homepage 'https://github.com/k1LoW/tbls'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.68.1/tbls_v1.68.1_darwin_arm64.zip'
      sha256 'eea458a6c7f0c8b3e222941b8fa0e17f0ed5a826fd2a1c762b3ab120e332244b'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.68.1/tbls_v1.68.1_darwin_amd64.zip'
      sha256 '4ffb23d199822879454b567e198027aff1f9eff948fd629cedf3622fe330771e'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.68.1/tbls_v1.68.1_linux_amd64.tar.gz'
      sha256 'e4d9a8fd6510f4b872550b32fb8abe42b9619947614d1b5d25956a8ce5e31617'
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
