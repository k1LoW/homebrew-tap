class Tbls < Formula
  desc 'tbls is a CI-Friendly tool for document a database, written in Go.'
  version '1.74.0'
  homepage 'https://github.com/k1LoW/tbls'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.74.0/tbls_v1.74.0_darwin_arm64.zip'
      sha256 '9e084a371ca13485fe998eca6812254697ec7d5c40eacf3df7f3d793545ab090'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.74.0/tbls_v1.74.0_darwin_amd64.zip'
      sha256 'bcb891d04e5d749d36a1c9c9e07e1a2ea19550b2ba439f7d6eb0c02a8703d2b5'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.74.0/tbls_v1.74.0_linux_arm64.tar.gz'
      sha256 '8877329920e72d45143783c8584965b8ef8ebbe850eedb632d320156ada4475b'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.74.0/tbls_v1.74.0_linux_amd64.tar.gz'
      sha256 'dd8bbd3053ab9884f966cc20295bd5c1582066fbea074dc61e7585d5400d8b2b'
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
