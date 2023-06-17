class Tbls < Formula
  desc "tbls is a CI-Friendly tool for document a database, written in Go."
  version '1.67.0'
  homepage 'https://github.com/k1LoW/tbls'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.67.0/tbls_v1.67.0_darwin_arm64.zip'
      sha256 '273fe0a0fedfc3dcdcc1438cc162b1313f0a2a0af9ea509c550c4c6644dd082f'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.67.0/tbls_v1.67.0_darwin_amd64.zip'
      sha256 'dd00d6b3661f7dea2da651a13253a9645ed30e9bc260c9250d72373f2a89decc'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.67.0/tbls_v1.67.0_linux_amd64.tar.gz'
      sha256 '7450199007456f935214b9925ff0f45d39f01676a86da81da673d605020294a0'
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
