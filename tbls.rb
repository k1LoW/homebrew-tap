class Tbls < Formula
  desc 'tbls is a CI-Friendly tool for document a database, written in Go.'
  version '1.92.0'
  homepage 'https://github.com/k1LoW/tbls'

  deprecate! date: "2025-08-02", because: "please use the official Homebrew formula instead"

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.92.0/tbls_v1.92.0_darwin_arm64.zip'
      sha256 'f97b4eac6018cb88b3206077ab52acb84611a03e41738e31ca6edaa10725c527'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.92.0/tbls_v1.92.0_darwin_amd64.zip'
      sha256 '75507ebe75c484d7776aa3854a7b5381dca0a739a048aa0f254f844a9b62b0c5'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.92.0/tbls_v1.92.0_linux_arm64.tar.gz'
      sha256 'b0e0490b06a3460b60670a7f97c22982e2c61142e38d93bb31d7404ed95197b7'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.92.0/tbls_v1.92.0_linux_amd64.tar.gz'
      sha256 'cb74fff8233d72d028b9ed5af571bd5dc701fcf5d866f1fcf5a560344de42480'
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
