class Tbls < Formula
  desc 'tbls is a CI-Friendly tool for document a database, written in Go.'
  version '1.92.3'
  homepage 'https://github.com/k1LoW/tbls'

  deprecate! date: "2025-08-02", because: "please use the official Homebrew formula instead"

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.92.3/tbls_v1.92.3_darwin_arm64.zip'
      sha256 'bf50d48c8c74a87231b2c7c7716f9ca24bb88ecfc41ce9fdf76224cc284a3d79'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.92.3/tbls_v1.92.3_darwin_amd64.zip'
      sha256 'ec3b6e0d0694f57310321d0d88aabc0858d4e5797fd0111eda764eb0cd831cd3'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.92.3/tbls_v1.92.3_linux_arm64.tar.gz'
      sha256 'fde5d0b15bff56f44b69dbd80bc04badec1741d37db9c17d30fcbf5cfc1f3d95'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tbls/releases/download/v1.92.3/tbls_v1.92.3_linux_amd64.tar.gz'
      sha256 'b952f08389ef7fe45fdd0c8e6d2afd2ac341f3d245987ac5d6c9298559490aa7'
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
