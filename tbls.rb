class Tbls < Formula
  desc "tbls is a CI-Friendly tool for document a database, written in Go."
  version '1.65.2'
  homepage 'https://github.com/k1LoW/tbls'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.65.2/tbls_v1.65.2_darwin_arm64.zip'
      sha256 '40c28367c17020e9e39a4d17544d28d41a34106160137ca8ac76cfd6bf0e9a9e'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.65.2/tbls_v1.65.2_darwin_amd64.zip'
      sha256 '44121a87fe7c1cea5c13ae6b21f7c285155bd372150376dc7d20674fa3830905'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.65.2/tbls_v1.65.2_linux_amd64.tar.gz'
      sha256 '6470d5303a22afe835a42ee426c33380fc7c326a643677e4dcdd6284c3ccb4b4'
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
