class Tbls < Formula
  desc 'tbls is a CI-Friendly tool for document a database, written in Go.'
  version '1.89.0'
  homepage 'https://github.com/k1LoW/tbls'

  deprecate! date: "2025-08-02", because: "please use the official Homebrew formula instead"

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.89.0/tbls_v1.89.0_darwin_arm64.zip'
      sha256 '47fc47c0315413d046ccf40ac4930d849b41a20cdd9df05961f38137a3b0aaea'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.89.0/tbls_v1.89.0_darwin_amd64.zip'
      sha256 '1f1b3ea15a4b236ba4d5402b677eb8d04b9e1822319d00dc1c2c77367664ff27'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.89.0/tbls_v1.89.0_linux_arm64.tar.gz'
      sha256 '5e161ce29b1c5174f77eeb117a0365f463d89808036aca0917474a473ae5bd9e'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.89.0/tbls_v1.89.0_linux_amd64.tar.gz'
      sha256 'cfab37b34560e84408af322240a141e730a4fa49a94a65e4baf23556591d6304'
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
