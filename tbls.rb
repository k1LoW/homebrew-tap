class Tbls < Formula
  desc 'tbls is a CI-Friendly tool for document a database, written in Go.'
  version '1.87.0'
  homepage 'https://github.com/k1LoW/tbls'

  deprecate! date: "2025-08-02", because: "please use the official Homebrew formula instead"

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.87.0/tbls_v1.87.0_darwin_arm64.zip'
      sha256 '5fd061f793723fc461106d89c4ba609d21e47bd07fb4f8320e797eeb33eef729'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.87.0/tbls_v1.87.0_darwin_amd64.zip'
      sha256 '120bd026cba40521fba3bf0569b7b6460b0d360940735bd89d71212bcc8c12fb'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.87.0/tbls_v1.87.0_linux_arm64.tar.gz'
      sha256 '27d8eccae81a10e658f4f2ee459025ae0bdb7a2dc794494ab0cf398f316562d1'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.87.0/tbls_v1.87.0_linux_amd64.tar.gz'
      sha256 '26546fb40be69c30c1e87d0bd6e15ce1e15c77e426e6bb6b2106faf99dedbe40'
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
