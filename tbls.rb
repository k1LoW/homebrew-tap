class Tbls < Formula
  desc 'tbls is a CI-Friendly tool for document a database, written in Go.'
  version '1.70.2'
  homepage 'https://github.com/k1LoW/tbls'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.70.2/tbls_v1.70.2_darwin_arm64.zip'
      sha256 '737fde2e5bead09a76050c734a345cbf44a90325ff82896bddf7e9be596cee7d'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.70.2/tbls_v1.70.2_darwin_amd64.zip'
      sha256 '93352f0fa00f4a8e24c8f75e2a9bfab1808b953be518766a80c9c135274a1486'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.70.2/tbls_v1.70.2_linux_arm64.tar.gz'
      sha256 'e7fd6a0921461ee696c83f434296c6151380204fdab17d18d441d92beb4d05c4'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.70.2/tbls_v1.70.2_linux_amd64.tar.gz'
      sha256 'aa1075b9d3dc70a0ab6d07fcc0911440df44d874ba8c2345708d578627eca0a7'
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
