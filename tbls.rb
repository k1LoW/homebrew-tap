class Tbls < Formula
  desc 'tbls is a CI-Friendly tool for document a database, written in Go.'
  version '1.79.2'
  homepage 'https://github.com/k1LoW/tbls'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.79.2/tbls_v1.79.2_darwin_arm64.zip'
      sha256 '0a5ff868c00e2fbb7d32e1174053ea7f35339b833b681cbabd800cdb8c5e1f46'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.79.2/tbls_v1.79.2_darwin_amd64.zip'
      sha256 'f9a1f259ea5dc9a09ae57ee2418b61c121fc96a6f32280f6fe14b182d168275e'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.79.2/tbls_v1.79.2_linux_arm64.tar.gz'
      sha256 '6ffe501f564c6d9dbd55f924c75419828539f1f35d9ee439321477ff1ed19c55'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.79.2/tbls_v1.79.2_linux_amd64.tar.gz'
      sha256 'bc274be498dfc9422fb88a66c1fa075ff49501b9d8652c5321dfe4ed561a433b'
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
