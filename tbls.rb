class Tbls < Formula
  desc "tbls is a CI-Friendly tool for document a database, written in Go."
  version '1.57.1'
  homepage 'https://github.com/k1LoW/tbls'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.57.1/tbls_v1.57.1_darwin_arm64.zip'
      sha256 '7a971c1b1fc138b4ccf8edc7bac18d4531609f0b55f02d86078b14529350b76f'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.57.1/tbls_v1.57.1_darwin_amd64.zip'
      sha256 '84dec10ae0d0e0095be023ab10efd3fbefb0954ac5519f49d807d57141f65558'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.57.1/tbls_v1.57.1_linux_amd64.tar.gz'
      sha256 '3f43c22e3f6777663eb8f17edd89007156b96be17f43bc9c188cb92cbd699d3a'
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
